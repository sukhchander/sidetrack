module Session
  def user_id_from_session(req,session_id=nil)
    user_id,session_id = nil,nil
    if req.cookies.has_key?('_session_key')
      session_id = req.cookies['_session_key'].strip if session_id.nil?
    end
    session = CACHE.get("session:#{session_id}")
    user_id = session[:user_id] unless session.nil?
  end
end
