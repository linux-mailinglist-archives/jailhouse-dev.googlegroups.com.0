Return-Path: <jailhouse-dev+bncBAABBTNCUSCAMGQEKWM7ORQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6836D353
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Apr 2021 09:39:58 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id k1-20020a2e88810000b02900c00f378c5csf7898945lji.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Apr 2021 00:39:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619595597; cv=pass;
        d=google.com; s=arc-20160816;
        b=WNrr1+Fp2NDrIuHKBF/rhZUCm/vhfUA23epQei52q22mJclSpgrH4cqmZUNdErxXli
         cv9HyA5G1mrIv4dFHKhYy9xyJg9QlGNjXYcyrPjPtdzcxEL/awhgcGla2mYJih3u5/mT
         JOiag7XyiOna+GBSXR140C21n4LRRx2ehD85p3/WXbs4F15uqK6ceCijdDHzndTvRpYg
         6O2mGxwW89c5eLeZ4PVZuzEEoxM+Lsf46g5hyJg6mH2H2MAvdYLNzKEjrvXjLFh4l+YI
         A6i2tYr+V6ttgUbP6PkerTNaSkvx4LyjRALdfwgLRTC5mM5t+qP5ExrRXerdXkz3xqjx
         O3jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version
         :content-transfer-encoding:subject:to:from:date:sender
         :dkim-signature;
        bh=loAszES98wSIdnJsa9Gu1wztFBRPcvMj/8FxoQ60nMc=;
        b=derVTULCz+AewuvUDpb/g9WaqGv4Bd7sT/I+5hM4RglTxkq62hXpmnpZWYtnG9SsGi
         OrQs2ILBK8ZsJSAZyclHOvuvu1UdvNfkCSg2CqalYzn5Hh3nWBHKzWKmd3UCQpCtFmPk
         JIcb/iDBvoyyG34Nj1ix9SmYpI1jeF4clD4hWVLRgbD+XIObfqpbGPIAXWXcCGES0aW1
         U/l1CMmi1qhm8BhFNR5T7xRF/U9UkxdSXe20hm+7r+Coyf3Ona4gr67D4XuZWSnHb+1e
         fl6cbfG85vFHo+WiPq3mval2NNTdvxeEaTSK7BSlHkx46D0edvixhNolv6U9CGFvjIEf
         Vt6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:subject:content-transfer-encoding:mime-version
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=loAszES98wSIdnJsa9Gu1wztFBRPcvMj/8FxoQ60nMc=;
        b=Uy2VLaePwZp4tMZ5wrwTGBGP310Uq8FfJm/ePOv9LPw4ToA5/URC2GcTbdJU/g5Fl2
         WSUkrt/QmU6zdIIVfnA5nMJ1UKlXCWeX/S38CYngq9i/XyTn5AcGc25csWa6QSZN5lD6
         Bd2INQUrVCibR7+H2f/0LbOJGvIC9XxnaGg0xpOZvetfLe9ngCVCXTcQTjfip4xL2jDj
         pptMfJuX8TSpFKR6WXJD9g5b8b/fVBSCMoNYJIhB7HZrBDKKNFEQug6FQwmn4FQrPE1V
         C3fYSbgS6LWK/ghcbUshTF9h3OlykdCwRtnlKgS4lu3cySTYcaKkhQ2GtutnnHHmDqMn
         BJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:subject
         :content-transfer-encoding:mime-version:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=loAszES98wSIdnJsa9Gu1wztFBRPcvMj/8FxoQ60nMc=;
        b=j9cVWKOzp/3CK4UTktDgPqVoZARF8yvg+VVb9wl8Z/TQ0cGZI/LYrUt50pjoZ8sqgc
         +c8uPCwtMs44M1GWpWD3sYPZXo0Mc31RsQZV4QmsNh5K1TBp+YEBUbhrvm/di3OjKF2S
         LCzfUHl1ZwJeNApzXOJjxcz4KeEgf+C+fiO/dXF21Es2bPGHqWpVMLxt3UMv9lz3N86D
         TkmSEL8RT+cjKhJ7pU+pywsKlz+kMpFDgQ0e60yzSVYdDyM4WVgvl+iFK8E9j2BD9wW+
         e86yI2wP0V0N7pYJQhiqF1/U1QNY6W/WM84QcTw4dz4ls37JJ3BLZWKY97Hcd9E5Qu4B
         sCQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533M4tRiDRK67nxmzjTQ6fkHiLDGlQrIt6UWvuIkODUenlx/4Kpv
	+R+8Q2/4L2Tj9VKmcLx74VU=
X-Google-Smtp-Source: ABdhPJwXFYmU5NbbJwqRyjApQ1BJ0wRVIGVrTf8EU6zkVUtsPx2Y6F+u0MW7f7ls1T68knN3thyPWQ==
X-Received: by 2002:a05:6512:922:: with SMTP id f2mr19018856lft.171.1619595597573;
        Wed, 28 Apr 2021 00:39:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5f9a:: with SMTP id r26ls245199lfe.2.gmail; Wed, 28 Apr
 2021 00:39:56 -0700 (PDT)
X-Received: by 2002:a05:6512:619:: with SMTP id b25mr19220250lfe.289.1619595596663;
        Wed, 28 Apr 2021 00:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619595596; cv=none;
        d=google.com; s=arc-20160816;
        b=mUtImfR2CJ1y9BNuavgOCxBJRNbgAvYllEDLrikH4cYxyWZLNcTBJPQeoi1xxJnGO+
         Y0hZ1oVfDHEcjs/Lt9ApvH8QSWdTe0gY1QGi7n1QQtJgo4LjZiWGO7Ved6nMqzJq/46x
         MWBotV90U4KBp0HVAW58izhzxZQ3CZOvZwDAVyCo67f8fQyLDfPKvUPdt7iKS/GoP6hm
         BZNN0SQqTPYUs159vUHanvK5TAQ/CUd5p+G1EZmXBvVYsIVvkiTuNTjc+iD38Qids5EB
         enwKyDoDAN0EA2slfB0W3S1gXhKIaBATbcJ01jfpOedkBNGY3dp5NUTHWPY/7rzDfFYj
         TlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:content-transfer-encoding:subject:to:from
         :date;
        bh=X9f6VvmVVUwacvVKrDpESiVVSugs5ZLUh0uksAi3MAA=;
        b=DL8Bx4BYSUBIF507sT8KWQm1XgeelHA3Vm57Cx+dLlQgiTAM23DVpJZBb8xkV5Ds6l
         p2f+QJ35W7Dthf2zlz9CMwQj2UK0QHt73rKHbPKtmi33yYXA2uOAlc6f4ne94YX9FADF
         /IK4e6ZALwdOw7frnu06Msehsaus/Pv910vI4U8d3rkyVkD0UPtiuwrehPSI9kQqBeq/
         25CA4hR3hCziB8LofrwMf5t/W6mLd/YXuJ47nmDdnpEe89S1Dmz6Zmden9ZSLVRlAJJ3
         Iai9NfglRY7NR+nUNHcauh4K4kO7lAoA6pi5aDv5MoJCgls1M6JMvaQqpEezZbUTnNu+
         RaLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net (zg8tmty1ljiyny4xntqumjca.icoremail.net. [165.227.154.27])
        by gmr-mx.google.com with SMTP id l11si1258832lfg.13.2021.04.28.00.39.55
        for <jailhouse-dev@googlegroups.com>;
        Wed, 28 Apr 2021 00:39:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) client-ip=165.227.154.27;
Received: by ajax-webmail-app2 (Coremail) ; Wed, 28 Apr 2021 15:39:52 +0800
 (GMT+08:00)
X-Originating-IP: [210.26.59.142]
Date: Wed, 28 Apr 2021 15:39:52 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>
To: jailhouse-dev@googlegroups.com
Subject: HELP about Jailhouse
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2021 www.mailtech.cn lzu.edu.cn
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Message-ID: <743a492d.2b32.179176b845e.Coremail.caohp19@lzu.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: zQmowADnSGZJEYlg1FUMAA--.3654W
X-CM-SenderInfo: hfdrx1arz6z6vxohv3gofq/1tbiAQsFBl2vOvTs-AABsk
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW7Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Original-Sender: caohp19@lzu.edu.cn
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as
 permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
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

Dear sir,
Last year, I used the rapi-linux-demo.cell to launch a second cell on my Ra=
spberry Pi 4 model B. And the memory size of second cell was about 184M.
However, that is not enough to me to execute some test on it. So I try to c=
hange the size of the cell in the rpi-linux-demo.c, but it failed (maybe oc=
cupied
 other's memory, I don't know). A good news is, someone fixed this problem.=
 The demo can provide 1G memory size=EF=BC=8C and I git clone the new proje=
ct.

BUT when I executed the operations same with before, I can not build the ja=
ilhouse

my operations is:
1. git clone https://github.com/siemens/jailhouse.git
2. sudo make &amp;&amp; make modules_install &amp;&amp; make install
3. sudo insmod driver/jailhouse.ko
4. sudo jailhouse enable configs/arm64/rpi4.cell=20

The 4th step is failed, the error is:
JAILHOUSE_ENABLE: Invalid argument

I don't know why it occurs. Because there are two project on my Raspberry (=
one is new, the other is cloned in last year ), the old one can run properl=
y.
If I can get your generous help, I will appreciate.

Yours sincerely,
Hongpeng Cao.=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/743a492d.2b32.179176b845e.Coremail.caohp19%40lzu.edu.cn.
