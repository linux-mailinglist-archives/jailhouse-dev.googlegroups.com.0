Return-Path: <jailhouse-dev+bncBCYIB5VXQ4GBB7GKUSCAMGQENEPMTDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83f.google.com (mail-qt1-x83f.google.com [IPv6:2607:f8b0:4864:20::83f])
	by mail.lfdr.de (Postfix) with ESMTPS id E61D036D474
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Apr 2021 11:06:05 +0200 (CEST)
Received: by mail-qt1-x83f.google.com with SMTP id p8-20020a05622a0488b02901bab8dfa0c5sf5050155qtx.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Apr 2021 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8VzBsjJNv2fjWVFOnpxvMqT6RVpYJAIvfR2TyNwAo5U=;
        b=du2nhz9YpGQp5OJoOdQ99LkLtR41mlPNs1v5+TUSwt4qKPiBGD7sYoc64mBctFwT9S
         qKhMEVx/UpGROaOSUzoZzXIQtNma53WDF+jUM2cwF3vfMTYCdpbqBOc9S28BU/EQ+83J
         CKGqWSBXzzyf4PKsYRg9Vag8JoNgwK4dlo73kaTY5DmEFGTysuLUdQiIlcMrt75LUFXr
         MJmo0E5KKQQzOyQgMrAle4hpGh8ulgN/M0StHW0wxPJPnRnCBB1Ib0I92fmLwQnORh3w
         OXbV0U4zqJXNmufvG4Aovz6mCAG1EunBKZcKqaBvh3rWgRsUSbvfU09+xEuqzsuk8tb6
         I2bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8VzBsjJNv2fjWVFOnpxvMqT6RVpYJAIvfR2TyNwAo5U=;
        b=G58fVmKQY0qSXGSR3cEFMAJgW29LnmklOMdHb382oUJAtvhawJQPUhO5pzVRirNaUO
         kIPD5pAingmPC7sLSzJ9a45LpANeHF42AiBT938tt5keteMu5HOtC9ur5++f/TT3oAq6
         ybw1bLU65gcdg35E6oiIRUDnMD7nT6sHgs6+dMWfz0qPS8VkXfcaT7ECstIB4PYQ07XX
         UvvhVeN+IH4PMDdxKP9A7JXcFCu4NqoyAj6f3qpSnIaFUna/mADs6Q1EKJRLbIbddWZU
         HNNPKkNk5AMLU5HT6OtUxAMTVJM8j3pDl6oobR6Txn+rqC3szXCrtzOuuuqeunhEk60L
         5oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8VzBsjJNv2fjWVFOnpxvMqT6RVpYJAIvfR2TyNwAo5U=;
        b=MUqU5pEg3QfTlFVaRnxvqdt5apwVLk0mk/MboPK5QPAmF+yPAoHM22yf1WiXzhD1AY
         15bWMJ4aMFGLd5CjR5FGtmh1MEANZMpQLz7raOa/BjVS6/d7I8Yf/mIbuAHd7rm+fCnp
         o1QJfDI7sjfjIuR4l7cvmuUyCKnmweh78b4+pnI2Oqin1feQQYUvyqjhYPI/WYPxdGcE
         QSEEOu0snC5a8PFd0iFRnH1IWL2TjobJ/AiE+KyVqyPklQvwMN8Ef3HOvP/wPrGEnJ8B
         B9lmXxrU05ASUHZsRrC+m5bAW2xBYvpE0emNa32Z+bZvJDPqWZQvDA0PCehuj1ERAeAe
         1zLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530VF+47317CHXLePC6t3u59geMhff7kt4ZbnkU1Dtrf1WLJDXEh
	PV/ZAzHcfJbclhh/ZjRKbQM=
X-Google-Smtp-Source: ABdhPJyJqyuWSkHmcFFoGMjS0okZlqxoogZ+4/xjQAlj6V7ZZQcC9HcW+26AmLQ4jn7YnsyNH6dj/w==
X-Received: by 2002:ac8:7768:: with SMTP id h8mr24487740qtu.171.1619600764866;
        Wed, 28 Apr 2021 02:06:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:7a82:: with SMTP id v124ls12970360qkc.3.gmail; Wed, 28
 Apr 2021 02:06:04 -0700 (PDT)
X-Received: by 2002:a37:a285:: with SMTP id l127mr27234381qke.462.1619600764053;
        Wed, 28 Apr 2021 02:06:04 -0700 (PDT)
Date: Wed, 28 Apr 2021 02:06:03 -0700 (PDT)
From: Adarsh Manoharan <adarsh.wintergreen@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2b60fc40-aa02-479f-8a06-3a125dccebc1n@googlegroups.com>
Subject: Android in jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2792_1857257891.1619600763439"
X-Original-Sender: adarsh.wintergreen@gmail.com
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

------=_Part_2792_1857257891.1619600763439
Content-Type: multipart/alternative; 
	boundary="----=_Part_2793_1310272214.1619600763439"

------=_Part_2793_1310272214.1619600763439
Content-Type: text/plain; charset="UTF-8"

Dear Jailhouse develop Team,
I want to setup jailhouse in J6EVM board and run android as guest OS in 
it.Is it possible to run android as guest OS in jailhouse? If yes ,can you 
help me with the required customizations to be done for doing so.
Your support is appreciated
Best Regards
Adarsh M

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2b60fc40-aa02-479f-8a06-3a125dccebc1n%40googlegroups.com.

------=_Part_2793_1310272214.1619600763439
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jailhouse develop Team,<div>I want to setup jailhouse in J6EVM board a=
nd run android as guest OS in it.Is it possible to run android as guest OS =
in jailhouse? If yes ,can you help me with the required customizations to b=
e done for doing so.</div><div>Your support is appreciated</div><div>Best R=
egards</div><div>Adarsh M</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2b60fc40-aa02-479f-8a06-3a125dccebc1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2b60fc40-aa02-479f-8a06-3a125dccebc1n%40googlegroups.co=
m</a>.<br />

------=_Part_2793_1310272214.1619600763439--

------=_Part_2792_1857257891.1619600763439--
