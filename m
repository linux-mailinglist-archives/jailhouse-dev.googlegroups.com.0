Return-Path: <jailhouse-dev+bncBCH6FY565IGRBWOY2OZAMGQEQWLT6HA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE88D0E92
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 May 2024 22:26:04 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id d2e1a72fcca58-6f8e9870f3fsf63861b3a.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 May 2024 13:26:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1716841562; cv=pass;
        d=google.com; s=arc-20160816;
        b=MxWJ3NoGW2TiyfH5eiDkKsvXsnI6O4/9d/gl1vILLpNHj1fza1K1xWgcU8QuMqEYcs
         Z+0/raQKrQxirovGb6uRVPvAR8xldgnwbmTOROkVFx3enwBSudRKK9xBIIGFFbpD2+Rp
         XJLmkyz/Qziscnk5/u0vgrLdfmHewg/L/cbV6tSvI5Cyrgal0sYNxC37Mb3fVQHrW+RO
         0TpqssvuegKQ2hNjbl8Zw45n0+oN80sMIidUS6D3kUinbrnWPJPPtinThZRcYiOjyzpL
         oDFY96oxgZqCdlvnrW9LOqB8JGafVKpo1IyoZjgXzxjzqwMG89fv/iEvqF3pELm8cM48
         Wvyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature:dkim-signature;
        bh=f3lzSwn/bgL/SGzn95cUN6l6UwUeHNJNcQllstHRNEM=;
        fh=uShSryWjduHi/mBnMCIJOIlbz26iaSnZ5PwKUQMdMQo=;
        b=dby0F3wtp1Tsnqtuo23QzA+K3t2FGwaqNavicZ+pt/g9Tmj62KgMeufuOboLuQeNWO
         PivkKqzJOXLuKjpOxIeg5mN2okIKpVyr748SA9VW7we8UPsMAvZiBdkhlo3YEy7DatNF
         3Lrr/eJUWPYBgPL82y94AxCDvXXac4o0BShG9mhWkP2Nd/A/XbJTqgh64pbFagmbstP0
         A4mw0VgVpF0IObKuQvoOXTtHgzkl3gPnbVT52TF7By+Prlv8aMYHbdeZO9S1nzKIClqG
         OtjQkPar3uznVlgeoAyFDU39svmBwBxyabYRBEuRvOyAi/fm7j1MbqW73wxWYv7cDif5
         5KOQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EG9Nk9p7;
       spf=pass (google.com: domain of jsoref@gmail.com designates 2607:f8b0:4864:20::e36 as permitted sender) smtp.mailfrom=jsoref@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1716841562; x=1717446362; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=f3lzSwn/bgL/SGzn95cUN6l6UwUeHNJNcQllstHRNEM=;
        b=wjhzl93xLsSPSw8n+PFgXUvom9y/a+GUdrzTjjvZs556Vjl2kc4EvrilnpiDQlMDQK
         jIvz6LBVFfeXNgUzBaMp+iCjY4u5PJqRKwJvw51dktGxNWpwNwqGXqaY7KGMzeYFcOrv
         6QSfYI9X7QVVIkpp6XmzTbXeO9QWB9NTkEScBVfef3NgWxnNVSCT8521gAysxIwTm7cN
         FRx0s1qhzxLqIpq4xdm74I90GOc1fFgRGk0cGlryqgyzIhHxYIBSRtGzSlxdsEsZNymT
         PzwJF+n6Y2Sl1tiJJLzXWfGv2cOCd+7S4q6EK3JOkCKmPkRF+NoIAZZVgmsCQcujq/ON
         S1zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716841562; x=1717446362; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f3lzSwn/bgL/SGzn95cUN6l6UwUeHNJNcQllstHRNEM=;
        b=iaBXiJOsA0MuAffLHW6EXrHHOmh4FHAEF4w9vykOjCe1ofs2mFN9jcFVylAR23y96W
         ftrplkrzsMEGFynDqorJu5inHn0L9X1LWLmCqGMr8rDSakgcGz2VyDbY+feCk3/HLME7
         ukb60sXJyuDmezcouk5pRG76En3Yt2QZcLQmIsSdqtUdi1lXuSXx4biP68CW+OWTinKv
         69Qh7lOZ+gcvFN9VbjkNqKJGnlnxeGGjtgQwJyQdpdQgmzdQTjZqs9EdX+zogeHymJ+c
         /B8MJIx+f3Ei7Lru1zu5ALGZCDhvvW/xHnvaTpUAKWlikRgMyP7TeDR00m5m9U7XfYFV
         KOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716841562; x=1717446362;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=f3lzSwn/bgL/SGzn95cUN6l6UwUeHNJNcQllstHRNEM=;
        b=iDeF9KoXx1Y7crzW7QO2FlTngEV5tAMqJip6+ZMnHTJaerIrolUmeQqTJfxKxqPSzg
         zxN0nYU+xc5ZkHX26h10dQEAzt4ZijHthx6qpcnKIIlB7mLlFo9K7f+Cqcd/H5P3YNRQ
         4HfbbVtyDeapqXJaoJjyDWfK2+5XxxbUfba/R0NwEMLytn73WTmPsuFIcyPCtW7Irhvq
         /+qA/djSG/E1/VbVHGO9Eo5LUHsgUtot4K2FLyS4nW64M0hXJl48VX8qIdc3j9As824o
         mXjXp5SLgEYlZUiad9KDqkkYcB7rhOZB0g2JzBv5I/lWBO7qVKFVNYWRLUg1D1z4g8X7
         2pmA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCXe745UIUh4Fz486sz27ow+c2AoF212nSLvZH3VhEDD+NPZ/baicuIKgO8QV4kG7aVoHIoivPBE4WOy1hj41kyYQnIZfLZajGenB7s=
X-Gm-Message-State: AOJu0Ywyk2nn/VgET5Ofpa5mxeYHTXIroR5g0Wndoeb3EF5MmadkSFNJ
	txKmLne9JSQDfOTWHsmJEBk8SpYR0aOdqKPaxmTpSGm2cU5i96CX
X-Google-Smtp-Source: AGHT+IH4cUl/eN85fIgKwsZYsV+McFxu6py5YAM39fc2EnKrcmIsYbVZRpJb+MraR3jk/PHezyVX8g==
X-Received: by 2002:a05:6a00:8c11:b0:6ea:950f:7d29 with SMTP id d2e1a72fcca58-6f8f390f6a9mr10430708b3a.20.1716841562457;
        Mon, 27 May 2024 13:26:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:cd5:b0:6f4:78b1:6b79 with SMTP id
 d2e1a72fcca58-701c20d86b1ls32430b3a.0.-pod-prod-04-us; Mon, 27 May 2024
 13:26:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:27a5:b0:1aa:6a28:cf6e with SMTP id adf61e73a8af0-1b212dfe65emr10070728637.48.1716841560642;
        Mon, 27 May 2024 13:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716841560; cv=none;
        d=google.com; s=arc-20160816;
        b=DGZf/kyJoTbsOiD0COwE9wtlOPV4WShtA2nCDpWTPwJtpKGi+dYVsP4slAVsEHMmEu
         ESXAcCHvNnduRRuDi63QCtxq59fTOXeh1KrEGfMeGnBuUHRLQi0M+aGFL+dxgdYHOc9u
         xRI0AcPaN2OMyiwAqQaxGLzJ/QMgaTN/brZoWAuC8jelQPMKyvnc72t2u4r3L3rQw/zh
         0euILmI5oSkO7RczjM+yJ3QYCDM+hN10HjnwYCmJoLslduYY3SDN3GvMwSJE0axzhmlE
         ENNfrTkli93CxOZeQxBTPQJbuBJ+kx6TqRmEsWR/ihDcaaShyoI+R1hr9GTaFYrW9gAT
         hsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=goWtoQZCqefiice99rIZpj1EnER7FsU7UOynYrEfP6c=;
        fh=EqSMUNjusmWmvXy4fylR6iMpn2vsKZQr1ZKWrIjEOG8=;
        b=JXQJeLD7rM0UKAjvNFnbEsJyiqASwfXldBjDNtk2tqnfiqXawmRuVB6QsYlN5oK0Is
         HAJncga6yI0Ao7OvSx/c2zWhVVuZAbu1yxN3Dyudc+OOarajytctQo2cvIPPxQS4uRHI
         iKaoQOCsn5r9SA1df3/IZvJ8Axd6qCit+FfNcfkEgeJhy3aCg9yDgOP1RvUz3VY8s3R6
         Yp8mH5JFEfnqeoAkCCCjyruRFeSCf2FRh9Tr2dH/bRUfxCTkWmtAC9UuUT3prKAuMpH9
         yjiMgXlS81nzLb9GvkUlkPbn37ZUeO1htWJJ3k7uP2mdUPxdpAypzhlhBUcl4ioCqXlo
         2l3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EG9Nk9p7;
       spf=pass (google.com: domain of jsoref@gmail.com designates 2607:f8b0:4864:20::e36 as permitted sender) smtp.mailfrom=jsoref@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com. [2607:f8b0:4864:20::e36])
        by gmr-mx.google.com with ESMTPS id d2e1a72fcca58-6f8fde0b6b8si316147b3a.5.2024.05.27.13.26.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 13:26:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsoref@gmail.com designates 2607:f8b0:4864:20::e36 as permitted sender) client-ip=2607:f8b0:4864:20::e36;
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-48a39be0e32so36000137.2
        for <jailhouse-dev@googlegroups.com>; Mon, 27 May 2024 13:26:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4406:b0:48a:5c7c:cf0b with SMTP id ada2fe7eead31-48a5c7cd053mr4945295137.8.1716841557921;
        Mon, 27 May 2024 13:25:57 -0700 (PDT)
Received: from localhost.localdomain ([72.139.29.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abca8728sm322289085a.4.2024.05.27.13.25.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 May 2024 13:25:57 -0700 (PDT)
From: Josh Soref <jsoref@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Josh Soref <2119212+jsoref@users.noreply.github.com>
Subject: [PATCH] README: drop IRC
Date: Mon, 27 May 2024 16:25:13 -0400
Message-ID: <20240527202523.86372-1-jsoref@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Original-Sender: jsoref@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=EG9Nk9p7;       spf=pass
 (google.com: domain of jsoref@gmail.com designates 2607:f8b0:4864:20::e36 as
 permitted sender) smtp.mailfrom=jsoref@gmail.com;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=gmail.com
Content-Type: text/plain; charset="UTF-8"
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

From: Josh Soref <2119212+jsoref@users.noreply.github.com>

As noted in 2022 on the ML, irc has not been active:
https://groups.google.com/g/jailhouse-dev/c/qhWeA5n2TWo/m/oiShgDinAQAJ

Neither Freenode nor Libera appear to have a live #jailhouse channel

Signed-off-by: Josh Soref <2119212+jsoref@users.noreply.github.com>
---
 README.md | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/README.md b/README.md
index dc2c3af..ad7aa76 100644
--- a/README.md
+++ b/README.md
@@ -43,10 +43,6 @@ Frequently Asked Questions (FAQ):
 
  - See [FAQ file](FAQ.md)
 
-IRC channel:
-  - Freenode, irc.freenode.net, #jailhouse
-  - [![Webchat](https://img.shields.io/badge/irc-freenode-blue.svg "IRC Freenode")](https://webchat.freenode.net/?channels=jailhouse)
-
 Mailing list:
 
   - jailhouse-dev@googlegroups.com
-- 
2.45.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20240527202523.86372-1-jsoref%40gmail.com.
