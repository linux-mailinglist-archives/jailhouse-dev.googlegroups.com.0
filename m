Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBSG3TXYAKGQEB6TSFHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13b.google.com (mail-il1-x13b.google.com [IPv6:2607:f8b0:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7946612BDD1
	for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Dec 2019 15:59:22 +0100 (CET)
Received: by mail-il1-x13b.google.com with SMTP id t4sf25276882ili.21
        for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Dec 2019 06:59:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577545161; cv=pass;
        d=google.com; s=arc-20160816;
        b=WyRz489fkQ31C/uQClQ6pw885MVAgf0MnEvd3cYKDxhLCBHiYDxpSfNApVdX2MmO+S
         lc3nz5YTIZh17rWKe3LqAV05x81YmLMxdSbWTmsBT3GfUutfJL5OaD8CKqLYDIUsVGRz
         vp5709cLzKNt1/cEKwGYi10B8xB5s0/MNm7zpbm+Pk/dlbg6XhqC744ZgG1PlfG6ZjHL
         GX5P3ef3PIcCZG6wx9R9EaIn6Ugoy3QR07ZbbYh/Byux+tpHo1me65nnJwtgMsJvPX+Y
         g3O24uZgHGtIXAD7NfJmHxtLOwHfkWpnYgS4vquA9qp8mMwK/0LW67XP2+6RCzS2gJXI
         Fqcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=DME186U/B+IapQ2VfWwIg6yxcfQSgu+DRur7oo2dTc8=;
        b=PmgJrN/aWFe4np8CnaWmWXvxubbZcGFXgEvXCxHr9o8WDdbkJK9g04M43PKy4qJK9U
         MpAUtBTtZdGuDjsNFz8wn2yZKGE9DPy46UYdmOD+8TyD0/JnyuSdeCKEN91WimyxCE6U
         fdRpMQUpGX0ksmkDHyoS/ejkpPLpPvbPoZSSaT854tq5jIvEHkyPIlrlKphaCx6Ag9oL
         hUOPdf689tbunh2cUzlNAvXdZp3P0lNLpHs59CQFgXLMF1upWu9iU1/pdfneq1IpKa6J
         ObxAffKZqi9FTIi3V4ALHYdR4oW2CczZyPmXb3JI8QoaWz4H30DVGRMV8nlBtz6bl97N
         +Z1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JNstR5mv;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DME186U/B+IapQ2VfWwIg6yxcfQSgu+DRur7oo2dTc8=;
        b=EpM6MFuJG2ouOcwzGBuH8oe9G/+1tvuNSwKfCcKLVDdyN+tn5xKFFRwbxKXZm38irV
         9BhJSJ9wmAYgn6lmP1YQQv7QmolafPBJCjp2s/LNlhmYBHRNmQWuJchVKpBdRF5sGysw
         57rJtmqZpC/WVSssrb/zOPYzozXrENBvoBSbmWOXt4WnaH79+zN1QYpevPJSIAZqOOP2
         gNiQfv4tIAcmeB/yuoTmcoZYLVsGgd6lbhMR2qKjAUIO5SmawqdZLVWjkxo1LgefgQYV
         AJ9y+8lexyFuTlOLWPXGsOzwSJKC56SGz60KtE98anyYGsGxxvsjSfmg72eFLb0l7sj5
         pJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DME186U/B+IapQ2VfWwIg6yxcfQSgu+DRur7oo2dTc8=;
        b=pz03Jym0bO+ISWUTp9xqDP7tXtaUTKiUC45mhksvhmPTcaxzrcTHewKyOhrOywILY6
         V2K79NFPv+uTNWp3Eu23n2aoTOezpLCdy6SZHQXPuqPASDoxiK12X62AUDdqAVJQ2wM6
         RqyrY6oJLoe/cNCJOROZPUDnCLqOG/WENEmhsav2hmBpN+mKBVbJHo/ngYtbYufbDJIG
         YiQUmBERWBuY5IMXdk0JpvMkAupfaBPu1VjFoUV3YaM7xAC1q8URCUl0vMVnH+859y15
         XYIjNRo03VoHExtypvS/KGuZn68HwtDbO4LwP5G3paVybvBtCfTZ/+DABMJ5tq8WkWN7
         HSwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVOpHkQYQc5tte1RZvdwKGEwdMW6qYd+jYqqlJ06oDOt+ag5VMU
	wJ3eBXG5MO8m9f+fU4TnzXk=
X-Google-Smtp-Source: APXvYqysQ//K+pPPRQiwjZoLX7NfF35irFSiV4gXUK9k/K07HaHh+8SLX6YbIpRlTH135jBl9bjPDA==
X-Received: by 2002:a5e:de04:: with SMTP id e4mr39586003iok.47.1577545160983;
        Sat, 28 Dec 2019 06:59:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:90f:: with SMTP id t15ls3601495ioi.15.gmail; Sat, 28 Dec
 2019 06:59:20 -0800 (PST)
X-Received: by 2002:a05:6602:2346:: with SMTP id r6mr40642753iot.133.1577545160508;
        Sat, 28 Dec 2019 06:59:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577545160; cv=none;
        d=google.com; s=arc-20160816;
        b=aVb7hN+j+HUnolkRUi6iUDIJtBWZAwkLRcJkqsYdIDqh8svHxGPwkSBDASIMocNsU6
         fw4RnQbQzuPlc5YPBks6V01iOiTR9fYlyL5IRYAdgTMeB7E2xFDF7tOTu2oFhGjx+Fuq
         /MFteHtiADrpP1VcwxVAR0iYLAekJcVxn6xtURILjA2HJ4X+tOOfPALzLIE7mDPQvs1d
         y+oFhQ07QSxud0LB99y5+Dp/rAZLqENBHJLSnkVOA6BwiGxBTxmFWG3pm6EyuPtbAbo4
         +yGFLOMo7ADTLNMOID+F/kxGayYaGqs4Db7n7+rvpGtApeSkfiVTUOXL/55kUWfwrwyO
         Qj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=UJ6+sp1jZ5hNWTu29+opFecU2MUvol9ruFti1Dza9SlYdlcH5oGrtda3vdG7h5uqET
         xgCKgBSmgN1sWNuu8JCwPKHIbJOPlQFW4D26EZxBdaJLisWicJHv0k+MVfQz8SILiQ+L
         OPTtTHiRHaBlEaJ0TNNCdQsAk3XgJo0iGk4pGy4re4daex3TochtndK3Wgd5Zppc6Eqz
         U0KA9OwhV28/ifsFYsWRq2u1lJ0k47qwOIuMfG4QjtKaOu+KQhMj+a2iDfLkcNaUI83d
         PIp7wfokoImdd9894mCVbw9e0HqlyVZboRJFE98MDJx2If72oSSUrv9q4YpcyaFWxrUY
         1Q7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JNstR5mv;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id v82si1849270ili.0.2019.12.28.06.59.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Dec 2019 06:59:20 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-2ef7ba1.ac4-iad.github.net (github-lowworker-2ef7ba1.ac4-iad.github.net [10.52.16.66])
	by smtp.github.com (Postfix) with ESMTP id 0A52B520440
	for <jailhouse-dev@googlegroups.com>; Sat, 28 Dec 2019 06:59:20 -0800 (PST)
Date: Sat, 28 Dec 2019 06:59:19 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/446d77-048806@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=JNstR5mv;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/446d77-048806%40github.com.
