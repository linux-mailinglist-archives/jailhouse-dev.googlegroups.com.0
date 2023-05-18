Return-Path: <jailhouse-dev+bncBCZZDH46UQNBBFMAS6RQMGQEH2NNPVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113e.google.com (mail-yw1-x113e.google.com [IPv6:2607:f8b0:4864:20::113e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB41707A0D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 18 May 2023 08:05:11 +0200 (CEST)
Received: by mail-yw1-x113e.google.com with SMTP id 00721157ae682-561eadd916fsf7460517b3.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 May 2023 23:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684389909; x=1686981909;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEnAOKCrNf24KN3do4bCId12tTFAFTF7sR5Eih0boWQ=;
        b=hL965zHqCX7DHM+oYsJh7hKOig5TizioXZ+6chndnpaHaGuEib/KobN2PFWxBxrjQW
         PMDCdSU3OUP6ipNsSiz/pItPEVzqSy1CpAWbgxA89B43ytlBYf1W8aJF4G6Y3mGi42m5
         ujOuxn9fMGsoqo2jeyC6zU5z99JL7LsoLEfUJdWKUzTPhSBoBUBvivFciFCySkJid29J
         Wn7h/sipE0pig/SJr0wh455SZzytpGWkMtqJhbdPGsAJ1hg84ozVm+nl6TArOP0IfFin
         +Vdi1flRnatrWAUzyv6OXpelIh3RyO/NxNaD6VD1vGpFqr+HRtDUaq8lN30wfKrSgceI
         8ORg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684389909; x=1686981909;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEnAOKCrNf24KN3do4bCId12tTFAFTF7sR5Eih0boWQ=;
        b=Q4nFnrw72v/Wb/fibWfJuXLlCj8qco4DeQMZEC+HIk1yh0rTV+lp1KNrNq15g0yDON
         P/HyA083VdGc96lrlgSs9COLWnCWQIRbUU9C/+P/pF+yKrxnVQK7K0Q9DpY7/yViPd6E
         H4Enskgo67k+w8ZiAucXOrjLRqRKB1dK8mKnsQsfOIk4sAlaUCReLRx6KZopjub/w/8P
         NuzXpVDOaadylCRWiPihM/VlA/Y0naoKsfBMKx+trWC4ZXojpv18+LizplnRU0xlxITv
         TwjmcCJcmMwm32zOOy9a9FcIGs2uoMJegO0ozCjaRGRqTlWUrqU9SIXdQDg8S99a8vXn
         ByCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684389909; x=1686981909;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEnAOKCrNf24KN3do4bCId12tTFAFTF7sR5Eih0boWQ=;
        b=goM3AhzVbX/N4MyQja2/1S3VJ39DPTqY11iVn/slZjSOIm0MkJAu4LP1xwXq3t2Rs3
         3ooRuVveoHgHfpOg9Qs/TBmGcR2lXTcm65mKXsennsn46m5eGPN2D+AUsIQ1rrnJdZQ3
         Olt2q3rNrmsOyR9kukdKtPPwV6qMJTLvlA4XYO5rhwIfCKgmN6bbdFxN2430Nh31klnR
         xTW3O0IcWgry1d5+RHIHGt78ldWGwHK2REqdrl+RBgl/f0i40weR8yEn9M+3qkpn8VXA
         mdBCDX2IDJWoqMt5Sd4xue/S/cxIFEt3cVtHykBBS0jK214SlOmxgRVJulzjBTWqqLd+
         JRWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDx40oeclgcITk+tZLPR27PDl/XUXQCIHlE2shTWRjEiN20RM/GB
	403AN1MqQu/X2YqRzMQY8B0=
X-Google-Smtp-Source: ACHHUZ5/XeAkAn+2wQZ/hguRhUBDR3stpzo+aD1DZeWZYFIt6+oUPHKNYv7/fgRt6zoZSADX5bRJpA==
X-Received: by 2002:a81:c444:0:b0:561:a64c:3d60 with SMTP id s4-20020a81c444000000b00561a64c3d60mr425647ywj.1.1684389909711;
        Wed, 17 May 2023 23:05:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ab52:0:b0:ba8:242b:4ba5 with SMTP id u76-20020a25ab52000000b00ba8242b4ba5ls411156ybi.1.-pod-prod-00-us;
 Wed, 17 May 2023 23:05:08 -0700 (PDT)
X-Received: by 2002:a5b:b0d:0:b0:b9e:7fbc:15e1 with SMTP id z13-20020a5b0b0d000000b00b9e7fbc15e1mr536315ybp.0.1684389908394;
        Wed, 17 May 2023 23:05:08 -0700 (PDT)
Date: Wed, 17 May 2023 23:05:07 -0700 (PDT)
From: Grant Ramsay <aunt.gramsay@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c87d6aa0-ef6d-419d-911c-59bcfeaf0a2cn@googlegroups.com>
Subject: Zephyr RTOS now supports Jailhouse ivshmem Ethernet
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_15958_1685759021.1684389907727"
X-Original-Sender: aunt.gramsay@gmail.com
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

------=_Part_15958_1685759021.1684389907727
Content-Type: multipart/alternative; 
	boundary="----=_Part_15959_861960579.1684389907727"

------=_Part_15959_861960579.1684389907727
Content-Type: text/plain; charset="UTF-8"

Hi, I thought people here might be interested that Zephyr RTOS has added 
support for Jailhouse ivshmem-v2 Ethernet.

PR:
https://github.com/zephyrproject-rtos/zephyr/pull/55202

QEMU sample:
https://docs.zephyrproject.org/latest/samples/drivers/ethernet/eth_ivshmem/README.html

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c87d6aa0-ef6d-419d-911c-59bcfeaf0a2cn%40googlegroups.com.

------=_Part_15959_861960579.1684389907727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi, I thought people here might be interested that Zephyr RTOS has add=
ed support for Jailhouse ivshmem-v2 Ethernet.</div><div><br /></div><div>PR=
:<br /></div><div>https://github.com/zephyrproject-rtos/zephyr/pull/55202</=
div><div><br /></div><div>QEMU sample:<br /></div><div>https://docs.zephyrp=
roject.org/latest/samples/drivers/ethernet/eth_ivshmem/README.html</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c87d6aa0-ef6d-419d-911c-59bcfeaf0a2cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c87d6aa0-ef6d-419d-911c-59bcfeaf0a2cn%40googlegroups.co=
m</a>.<br />

------=_Part_15959_861960579.1684389907727--

------=_Part_15958_1685759021.1684389907727--
