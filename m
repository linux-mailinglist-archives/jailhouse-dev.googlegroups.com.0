Return-Path: <jailhouse-dev+bncBDQKRTU7ZIKBBI4JRSKQMGQEDQNVDGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id B5679545F92
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jun 2022 10:45:24 +0200 (CEST)
Received: by mail-qv1-xf3f.google.com with SMTP id kd24-20020a056214401800b0046d7fd4a421sf4056431qvb.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jun 2022 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YJx/mZwb0a55aEZgfXYMUJ+pcSw5m1jxatlZGD9Pxjw=;
        b=XSxU4kAiXk1FOmfZmZO5Kw8mkX32EDJKGbVDN+Mcc/Px0DJNMHEqVkMDysScMNNonG
         kVZBkHSY+rTJCnZ2D09iEj1AGsw78Rl7mLxdQOWsu0ECC6mNvgLm5PnB7bOc/hVSySQw
         zJZW3wjP70Qmk3S/AaITTaMjBs4r/FMFUdDSd0y5gx/HcCqAxNeuu+PSUfAtEMMKMAdq
         vK1/kclY9ULq62Ak5qClh0GXZSmgL9nRoMo/kRwDjCgByVD4/RGJw8TxOfyMzMFwGIXU
         eXdJqJdYC+Kwm6KHk8w8H53h0yZb9l2TZoUR1qUf9l8f/vmDny6Ufiu3Vyab93+Xp5H5
         ZzcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YJx/mZwb0a55aEZgfXYMUJ+pcSw5m1jxatlZGD9Pxjw=;
        b=aCws1Hf7m/U+w/dC7EXliQbCTSvKw9tgf+cCW1AC21+w2z3CS7c39J1QPhlznN41sT
         5AjroGVCAak+dAOciNkCBhhUq4t+ifJN0osxSIyisbk6d1UT11OTvbArPveW7LBDZtK8
         5MErVU8ZEkg17s1GCbcbwIGM1hxwQO/qQHexZbqd3XRghaFdUSLjJmWhgrAyFbQoi442
         BnT91hmEE21vRRi9CCXIYLWrjvYBcDqheT0V7Yke0jc3/pskD2ohRYqE2aDnFWNG7L4Z
         gsiYf/TVtiOZxEsQF/pydIeY8NFB0AUxgNURzeLVQoa0Hv7O5iv1mt83H8b6o7PEgJtF
         OBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YJx/mZwb0a55aEZgfXYMUJ+pcSw5m1jxatlZGD9Pxjw=;
        b=H/Ay7fm3HBjL409csm0lS/W3T/Nh5IZhrflvbuSrsJV9vdtBd7CETuPBiipOpNvwxC
         zYfGv/yYhQH2faEsl3x297SVdl2O9mP69qlYbKQKKY/ZONjGYpWWh+mCZFtG8+j+Sl/P
         iICVFdpSl5hZ6tpdR5M9LyeddR5OJpjud1POmiICTlBjfDmEkIY/hp609minYr03rURK
         q7omkVpOumgJUuR2nQc0EqNVBcDkRVr4ERmWmL7yo+kgO/HzoDc0oajS0fXsZBaxe9H/
         vq8syekFpm7FccYWBA+Aa6bWyzF+JfZH3u49IKtVYYdut8Ra/djU6OTnzZVZAlechMM4
         ZJqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531QGL+n7kfxLxdD8d6Ln4ZAwCVbwRB/nNmA974/dFZV4cqd5y7z
	4xBvTlLXeQLJIhMJ+8P0WOw=
X-Google-Smtp-Source: ABdhPJyVg8hoIr2W9qGgtUYxl1QvG6bo68/L6QRpIwa0vI/hXzaJ7DsKmlUxb4wF8pD27ft6tOWeOg==
X-Received: by 2002:a05:6214:234b:b0:467:d7b4:1144 with SMTP id hu11-20020a056214234b00b00467d7b41144mr29958892qvb.85.1654850723690;
        Fri, 10 Jun 2022 01:45:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:57ce:0:b0:2f3:fa4c:f063 with SMTP id w14-20020ac857ce000000b002f3fa4cf063ls8630834qta.9.gmail;
 Fri, 10 Jun 2022 01:45:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1888:b0:304:f1ca:3bb8 with SMTP id v8-20020a05622a188800b00304f1ca3bb8mr18171948qtc.296.1654850722815;
        Fri, 10 Jun 2022 01:45:22 -0700 (PDT)
Date: Fri, 10 Jun 2022 01:45:22 -0700 (PDT)
From: star sun <sunxing960116@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2e20edba-6a84-466c-8cac-74e7a132c9f1n@googlegroups.com>
Subject: Beginner asking for Help~
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_894_99964791.1654850722301"
X-Original-Sender: sunxing960116@gmail.com
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

------=_Part_894_99964791.1654850722301
Content-Type: multipart/alternative; 
	boundary="----=_Part_895_1418728076.1654850722301"

------=_Part_895_1418728076.1654850722301
Content-Type: text/plain; charset="UTF-8"




As a rookie, I tried to jailhouse on an SOC but kept failing. But I don't 
know how to write CELL files, even when imitating demo. The problem is 
always memory allocation and hardware partitioning. 

Can someone help me? Tell me about your experience or where you can find 
documentation. Jailhouse-master has very little information about the cell 

Thanks!

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2e20edba-6a84-466c-8cac-74e7a132c9f1n%40googlegroups.com.

------=_Part_895_1418728076.1654850722301
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p><br>As a rookie, I tried to jailhouse on an SOC but kept failing. But I =
don't know how to write CELL files, even when imitating demo. The problem i=
s always memory allocation and hardware partitioning.
</p><p>
</p><p>Can someone help me? Tell me about your experience or where you can =
find documentation. Jailhouse-master has very little information about the =
cell
</p><p>
</p><p>Thanks!</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2e20edba-6a84-466c-8cac-74e7a132c9f1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2e20edba-6a84-466c-8cac-74e7a132c9f1n%40googlegroups.co=
m</a>.<br />

------=_Part_895_1418728076.1654850722301--

------=_Part_894_99964791.1654850722301--
