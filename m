Return-Path: <jailhouse-dev+bncBCR3L36NTQEBBAXR2SCQMGQEGF4E4TI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 61371396854
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 21:27:00 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id k125-20020a3788830000b02903a65618d46csf10106364qkd.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 12:27:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622489219; cv=pass;
        d=google.com; s=arc-20160816;
        b=WluEeCg3d2UaCwXyM7pV8lxTScOW3+/7wjliaxnGqGg3xD+yS0WZL6WxQSFXRFo2sU
         mZaRSQyCjWYwFiBt6fDgbPF0gDGM6KCdFDABfTL44nNJu2fgpS5J6r2p/i2b/twsxFtw
         Xv43xSy3r2UUIzrU9PzOTCSsBNWXfoknc3eFdEhwspNfrsV/M8fMwPNURfawyv+y0xml
         rs2xDsIZTidwjqZuGvpaVURuKzMhTDJJVoBeJFLtBfGakFe19AYRVuHONWW4Goxw01U/
         +CEoDjioJSbgfoMXNVgE62zRFcLOgh+bJLtsYZ0o5r7WusnEfzqp7TBqExyBxcgjgNzG
         GJaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=YLYdK7e3hN759rmTpQ4knQ82Rkyyb1dJ0E++mzyZ9rQ=;
        b=y9X7y8AWVZBegNSLLQCKb1efFoFV9I5cCu7QoCG825CQ8pni9Bfh3JkZtcwdijOzIJ
         m/Dj6XZW7cuVALGC/Z4MeaFoBjgk98ljhSdgLdhFqH0+44lp+daTdkBbiG5lHdEZPTBW
         MDxDPTbsFfjY1JPxppfZpBqfeVV0TmOQoaVuV1jGrAo1baJ/y3UmwHOBwpsY0/0JDWVz
         +8QdKVHSg5UZnihH6fwIyWbzSjJ7uzCY3gU8JSrtbqLY6+SNtjKw/KrNYZnGKEGu85DS
         DAYZLnHLIPQJ9qwM9LEgDC8QHzZ4Ge6w0Ef2HGKAIUWrWILxcswpu79UkTRYDKg0knBH
         TwVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pGyaLyva;
       spf=pass (google.com: domain of nuruelyag@gmail.com designates 2607:f8b0:4864:20::134 as permitted sender) smtp.mailfrom=nuruelyag@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YLYdK7e3hN759rmTpQ4knQ82Rkyyb1dJ0E++mzyZ9rQ=;
        b=oBi7fUdXOb5VhA8QS11N3mVAbFNkvcPsfjfgmAH6Rhe25j66I4PEAsvs/q+hPFrf9+
         jzisWFrix4xVUidequhgJfeEuwly0Tq3fhG0hON7qEUNaTCFqCD59VPN9JKDjRBozsSh
         eqv1q6XZ9ULfmFGRrez/m1y3tO5QtpaS1a8b6vsp/LZqfm3vTMWmALjFksqDef5g1wtv
         fyln/iRJ+t2TU7huf1wNHJOi6qfoaIWgnnh6VckHhXP510Ptp/oo6Q8MdIK7TT/aT1Cf
         HuHseAuCwLZ4wLgLneesbq+At7YZRZm+44B/5UTd1KIZtymt3wYSCBlJwlGpn5Y8+btE
         5ywA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YLYdK7e3hN759rmTpQ4knQ82Rkyyb1dJ0E++mzyZ9rQ=;
        b=tcaGJwXzJtaFQunrSkdyp1DleUZSMjYJ9pEihwqFCaluSFcM1aQg7DokMJxMPpNZ3n
         3r/YGo0gLui44Qxq6mW9HaG4oxfbcVfsiujcLmsbPXogP5LOVVsUUh07luNXWkKVK9Y5
         5Jwi7+r9Sdn9eKvi8c4eguIlVqYLfk1lvFh2Ifpt9DHKzC76r3/DW7igwbbmCIUq4sqG
         NTTFDPScWxZ5afZ7eFhrkCi0jwbjBrg/c1q1/jWmHI5btFqT7mrDdT2L7LQJuEcPA1Ua
         du9RKnqY4VfLhBsYu2b0dJr+UwgnBVU/DSphYpxIju/RfjUYE/Hzn2yWf82DiBbr9F8U
         vSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:reply-to:from:date
         :message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YLYdK7e3hN759rmTpQ4knQ82Rkyyb1dJ0E++mzyZ9rQ=;
        b=DQMrQDHSlXMlXZPT0BHJ8B6x+LfVcbo65PJ1qp0SysfRmDeJU5K4gTm9S7NMUKe5LW
         cD10n69HRwouTtNQYEzoruRtfEGNqJAR4PLWqp2d/z4EKgTgHbmJESdkE8hnq/J13NBo
         hfCRXaQHeKwP8M3o88IgK7Yr46TFFawjRcColdIlGs9+epyIjVjN7Vh/IYoDUydXBNgi
         Geu68eGRCVwbsSD7m+ehdbyuqsOuIv5iIFxrYUg7x0gCeJxQZEKJMiTI1OoSki4LURcA
         UZAM7x8XblIj/TPA3ohOSIycWO442r6ROeHe0C7YBYlxbuHN1JYEWM4s3Xbi4Ln29sVo
         xNXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533n+pnAVAjPJCE7MnnQ4gf6aG6E4ijFF6u2ktFCeBtOESwSo3+i
	zWqO2hUm0gIQomS275paUMo=
X-Google-Smtp-Source: ABdhPJw+AYqjXuj3fUp5jS+Z+WHygsUx5FB1uH4ucyDuPLcqYBBGamDCDBgnGtA+orSCF2wrugHIcA==
X-Received: by 2002:a05:620a:158a:: with SMTP id d10mr17632053qkk.268.1622489219101;
        Mon, 31 May 2021 12:26:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:50d:: with SMTP id u13ls6807885qtg.3.gmail; Mon, 31 May
 2021 12:26:58 -0700 (PDT)
X-Received: by 2002:ac8:7a65:: with SMTP id w5mr16156153qtt.370.1622489218668;
        Mon, 31 May 2021 12:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622489218; cv=none;
        d=google.com; s=arc-20160816;
        b=BVj7DCxwyVPTw0r6d9THFSqaMxlJhOKHC5SEM2hHZeMrVnh5BGeXltUjWqKml6+RAh
         iSU2iyHr76YJvq3TjqwcBhxSdRYwLMIksK8L1VzeitMnSvCJplTEvAo3fonCtxgABgGW
         BlzCX0VC72DMOKrgArszNw5aTu4OlAeJLYqkIyNHp5R+oRHZkw4lC+NotcgEjKb4+Es3
         zq6t4hnWzUoxD54YW8I9cGZxc+SlJDh2WxQjodCXq0S8oZUhRChJH8XwIrDuFbmo32DO
         Fss1aI7g3/Qi1P/TM5lfwEkS+EAM4jsuvhdVqdj6xgx5Evs352CUGrDNCoAH5a3Zw15d
         kYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=pDFxG7VQh8w/j0MQ9kb5g324X46YhyItfelyMryxj/Y=;
        b=oEVfhWGQ4/ddfn/7i6EKdLQ5EkBPTYDtSY4vNomzQYITdGgpFqAPv5ZmsHHX32wxnj
         KDtV+WqAkSljM8nktxEIxIZqg94T17Gd8z01Ll237fuHTD4dcMCCjL/aPSj+97rI47Gu
         d4T3p30y4dbiTyEJmNu9QfdYZygbQglqtVpJJfBNftfBWuTc9Nuv6AS5ehKR4hO0gosf
         XbGkPsy8ZgorKixCbIVio5TpLuFCWOTUjLnXnMDMvYjD5llPTd8MDFfRca8ZTbS0n+dn
         bTPFBWA7NrdKE9EbUpSr6HBdocBJK6v2DNqQrph6RJz+HMBma5VR2n1tYpPqMJEIKv1d
         xS/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=pGyaLyva;
       spf=pass (google.com: domain of nuruelyag@gmail.com designates 2607:f8b0:4864:20::134 as permitted sender) smtp.mailfrom=nuruelyag@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com. [2607:f8b0:4864:20::134])
        by gmr-mx.google.com with ESMTPS id d207si1287528qkg.5.2021.05.31.12.26.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 12:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of nuruelyag@gmail.com designates 2607:f8b0:4864:20::134 as permitted sender) client-ip=2607:f8b0:4864:20::134;
Received: by mail-il1-x134.google.com with SMTP id x18so5278627ila.10
        for <jailhouse-dev@googlegroups.com>; Mon, 31 May 2021 12:26:58 -0700 (PDT)
X-Received: by 2002:a05:6e02:92a:: with SMTP id o10mr18403698ilt.270.1622489218014;
 Mon, 31 May 2021 12:26:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:7802:0:0:0:0:0 with HTTP; Mon, 31 May 2021 12:26:56
 -0700 (PDT)
Reply-To: kath.rafael2020@yahoo.com
From: Katherine Rafael <nuruelyag@gmail.com>
Date: Mon, 31 May 2021 19:26:56 +0000
Message-ID: <CABFMN1FJb5K4Vh+r2JKznSJOMENT39fkhWK2NJd5NK7ZVpA-5A@mail.gmail.com>
Subject: Yang paling kusayangi,
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: nuruelyag@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=pGyaLyva;       spf=pass
 (google.com: domain of nuruelyag@gmail.com designates 2607:f8b0:4864:20::134
 as permitted sender) smtp.mailfrom=nuruelyag@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

-- 
My dearest in Mind,

My name is Mrs. Katherine Rafael, a business woman an Ivorian Citizen
and born in 1961. I have a mission for you worth $ 2 500, 000, 00 (Two
Million Five Hundred Thousand United State Dollars) which I intend
using for CHARITY.

I am a breast cancer woman and have told by doctor that I will die in
no distance future, now and want to donate this money for charity
through you by transferring this money to your account, to enable
people in your area benefit from it.

Could you be the one I will use in this noble transaction before I
will go for my surgery?


Mrs. Katherine.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CABFMN1FJb5K4Vh%2Br2JKznSJOMENT39fkhWK2NJd5NK7ZVpA-5A%40mail.gmail.com.
