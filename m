Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBB6OHZ74QKGQE666DWMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB824298B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 14:43:38 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id w30sf1546383qte.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FDUtoKuGSqGQ9fEz9Qhn+3bMoN5O5nUJTEFuZUNCmao=;
        b=L3/r0o8+1rzEm6Q43F3OD/pnnBbSKeMQ1lUhJcepKkJMIA9tp2Jv4JszvvDPtw6rtQ
         IBFlOBwjGZPbAbLsPP2GjgEUjbRWx3TcU/Jw8q9K6c15YzSNsg+zQutsEf+zGnCQpqkQ
         4aWzZ/T+Gqw2NHTWi4I4HPXCCBuH0C4IUuOKBlzrbhgOmAyD1M9o8bEHqqAD9zKkGCyn
         G0LObid6j8S5rbEpXSQKhR8XkgXFKf1sWUPSW/pSwmkCK+zIslT18CIZEZZCzxoaKKbp
         m2nREh7sjBRl5ZdECnE4qFHLQNojiq2uZUIRbmAKZKubr2DDorocb5HBdXEunnpw30IU
         WF9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FDUtoKuGSqGQ9fEz9Qhn+3bMoN5O5nUJTEFuZUNCmao=;
        b=oYv+S5XBj2iATWm/Wt+5OyZ4eGKs7xf+rvrSRG6hC3GsKi/QHO3SU4NDHeaq+2i+Aq
         WHHXYQR1s3sG4q1M204bFjkCFmjlazdaWRz/2eQZIspvJzNEEgOYYFLXofCnQE736UDQ
         oa5MN/z+2CSFlZQI2Av6FS5kVeB4S6F6nta34VBksrRnVrGbQ6VUl0O5p+6Vb+m5aleL
         Uv0NyqPwFPpoY0NucToUUxm8qkOi6fHVgVBoHcmQRzm9CDIQ5+ZLXIn8QBke6yYp5l39
         AhQCdKFiFsIEQKntwyp7UM5+ihvtChEJeXl4bDWlGZLtK33RSfYw19nIuS5/DFXuxA1+
         6ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FDUtoKuGSqGQ9fEz9Qhn+3bMoN5O5nUJTEFuZUNCmao=;
        b=EI3KX4S5AMvf65bouYkkxVTt2P+aY9GS9Ddqtf0POq4HpeKkG8RuxtaFhgNXSEh3AM
         NttLSmbopCKZU8f8Yyd4da+XuItu6Z+Gv8JNtXXyotXqh9gb95T+AYGOGsXRa6n2YvlC
         HmeTwRGlmL/9x173tmiEhk4u73jB8JpqnV60VFAXquPn9YpvWtd2OZrTSqu71WgFCgXn
         eFMOQYDprbtNRaU2EwRdB+BbwLCc379jgVht08Cc+kqnjk8QksyL9D8D0X/qveJiwI8R
         /gi6t1SUSlnmGNeVaxLmHDbQZxJtVVMExoScSxNnhcl5HYY33YwFA5LthPxi/Kl2SwAq
         gKZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533+U5a5y8FI3HBYxcmRy2nDpkI3N441but2mryz4gCNs3owrBcO
	N6quhl7wpJrXf6AIkthR6w0=
X-Google-Smtp-Source: ABdhPJzMFNYhqL/bh2K2BHt3u6GfQubACJ/V0iOoUlN9/JAqyehXn2e0iXz+X3dCcJZ2IfOXLLuRHQ==
X-Received: by 2002:a0c:b791:: with SMTP id l17mr6656057qve.44.1597236218005;
        Wed, 12 Aug 2020 05:43:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:2f66:: with SMTP id l93ls681958qtd.8.gmail; Wed, 12 Aug
 2020 05:43:37 -0700 (PDT)
X-Received: by 2002:ac8:1b0f:: with SMTP id y15mr6280953qtj.144.1597236217323;
        Wed, 12 Aug 2020 05:43:37 -0700 (PDT)
Date: Wed, 12 Aug 2020 05:43:36 -0700 (PDT)
From: Vipul Suneja <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d5e0edf5-118c-4827-b21e-37975bbddffeo@googlegroups.com>
Subject: imx8: could run linux in non-root cell, how to copy data from host
 system or from root cell to non-root cell.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1683_815774133.1597236216848"
X-Original-Sender: vsuneja63@gmail.com
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

------=_Part_1683_815774133.1597236216848
Content-Type: multipart/alternative; 
	boundary="----=_Part_1684_9863106.1597236216849"

------=_Part_1684_9863106.1597236216849
Content-Type: text/plain; charset="UTF-8"


I could run yocto bsp 5.4.24 image in root cell(SD card) & non root 
cell(emmc). Trying to copy some binary (from host machine)to run on 
non-root cell image but unable to copy via ethernet. I found ivshmem in 
configuration for communication between cells. What are the steps to use it 
& to share data between cells.

Thanks
Vipul

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d5e0edf5-118c-4827-b21e-37975bbddffeo%40googlegroups.com.

------=_Part_1684_9863106.1597236216849
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>I could run yocto bsp 5.4.24 image in =
root cell(SD card) &amp; non root cell(emmc). Trying to copy some binary (f=
rom host machine)to run on non-root cell image but unable to copy via ether=
net. I found ivshmem in configuration for communication between cells. What=
 are the steps to use it &amp; to share data between cells.</div><div><br><=
/div><div>Thanks</div><div>Vipul<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d5e0edf5-118c-4827-b21e-37975bbddffeo%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d5e0edf5-118c-4827-b21e-37975bbddffeo%40googlegroups.co=
m</a>.<br />

------=_Part_1684_9863106.1597236216849--

------=_Part_1683_815774133.1597236216848--
