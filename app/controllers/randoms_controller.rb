class RandomsController < ApplicationController
  def index
  end

  def prepend
    @random = rand(1000)
    @dom_id = generate_dom_id

    respond_to do |format|
      format.turbo_stream { render partial: 'prepend' }
      format.html         { redirect_to randoms_url }
    end
  end

  def append
    @random = rand(1000)
    @dom_id = generate_dom_id

    respond_to do |format|
      format.turbo_stream { render partial: 'append' }
      format.html         { redirect_to randoms_url }
    end
  end

  def replace
    @random = rand(1000)
    @target_dom_id = params[:id]
    @dom_id = generate_dom_id

    respond_to do |format|
      format.turbo_stream { render partial: 'replace' }
      format.html         { redirect_to randoms_url }
    end
  end

  def update
    @random = rand(1000)
    @dom_id = params[:id]

    respond_to do |format|
      format.turbo_stream { render partial: 'update' }
      format.html         { redirect_to randoms_url }
    end
  end

  def destroy
    # 実際のところこの処理だけならブラウザだけで完結できるが
    # デモとして実装
    # 実際のアプリではデータ削除をやったあとに削除用のHTML片を返す感じ
    @dom_id = params[:id]

    respond_to do |format|
      format.turbo_stream { render partial: 'destroy' }
      format.html         { redirect_to randoms_url }
    end
  end

  def add_before
    @random = rand(1000)
    @target_dom_id = params[:id]
    @dom_id = generate_dom_id

    respond_to do |format|
      format.turbo_stream { render partial: 'add_before' }
      format.html         { redirect_to randoms_url }
    end
  end

  def add_after
    @random = rand(1000)
    @target_dom_id = params[:id]
    @dom_id = generate_dom_id

    respond_to do |format|
      format.turbo_stream { render partial: 'add_after' }
      format.html         { redirect_to randoms_url }
    end
  end

  private

  def generate_dom_id
    "random_#{ (Time.current.to_f * 1000).to_i }" # かぶらなければ何でも
  end
end
