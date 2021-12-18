Return-Path: <jailhouse-dev+bncBC653PXTYYERBP5666GQMGQE52P2A4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6CF479AF9
	for <lists+jailhouse-dev@lfdr.de>; Sat, 18 Dec 2021 14:16:48 +0100 (CET)
Received: by mail-qt1-x837.google.com with SMTP id a8-20020ac86108000000b002b63fc40062sf5099430qtm.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 18 Dec 2021 05:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=epbB/VgWyJzPNRLbymYxMsp25B8Bx+KaZSGDvo1uJuo=;
        b=TN8uIKmYv2Z4EVBgA3Y+0h7pwCMTQLI5OnNQ+qqjsjSF9RVG32juhi3CZbmKcwjG5E
         +3tWbAYubyaIWxEjS5Ov2ynoHlhFoxdGCmaVpT06Qx1/C+DHMLqpQnvo6eWlby4SModH
         MqDCXWb6xImPtfbhqpS68iVHT0VwiPc3R7/PhRZyhlkPjm9UZXXc1aFYiUhGLv3VtreU
         aflv3ws89NGG/hL1kloeGIqZgQPlsXelZS4B7z3Wx/hzwGqkVofKFyiicf3BCjxPB2/i
         F0Qd+ujhnL5TIbnxBibnC5VX75nAqMI9WYlhgGbis0cZ2l60L2+qtpDvzRuBDs3wK/6R
         QfoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=epbB/VgWyJzPNRLbymYxMsp25B8Bx+KaZSGDvo1uJuo=;
        b=UWr41iMyd0DO6Sb08b6xkQJHAsGGT0oHgHkp7UFPRuqVvKT5zY+nsvpEM6oCBh/oa8
         6fJLDmhoGZQVloVIdL5hotwNk96huJvW3PByf8bn/HKUfE6Hqqg6+NAgNd0wQcek8LKJ
         9FajvfhH8RGuMd5VPrG9PhxF7vdAEnenrOpKUAVLc26R1v5N+QVPkkkV1088KVxbHr2v
         pG2Y+LXM6Z1TzCY4UbinCSyGoQ6f6POMBQlWD98LP1n2GqfYyoVTwg6OVu3QFXOwP1Mc
         DETeIaJMddLDcjZb35sApzdeQaYtnNvAj8vk9ufzHflzLu5ae76HWZ2L6WeNrHQ9AhzE
         N6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=epbB/VgWyJzPNRLbymYxMsp25B8Bx+KaZSGDvo1uJuo=;
        b=73fYxI5tT6Rm3N6I1sxGpkNlC5OCWWWg/9sJScIbBuY2AU9Xog3cEoQJhek03McoQq
         Al7A0b8L1IEx/ZyUelnjC3TVhtLRMk1kBnJCVC78f7YVNmUu5FVy4yb5ILpxPe3b+P3R
         HoNRUPUsbDL/yj6yyr0OHpaYZbi/REkpep2TKRJ5RlPhRtUitCL2HRjmo5vOk4YpPHCB
         QuMwzta1K9v8oV0cKKnE2ZAKZ+WLckiIuGQlIv8EhJ7GZChY3txuj9FRJMHUd1fozA4y
         nyf/D5GC8YeUVm4vhRxKaXUcvWiRrlO6T8lhobO/PkrGl2rf7sB1iluJzNWat/MnBTzh
         sPLg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336qmSqS7MDi8mEt9q2Iiwr13wMUIkOA0PziCDEn9gtrOyuzTlA
	u+j5O8rc9g9gdumcq2czm9M=
X-Google-Smtp-Source: ABdhPJzK+Nu/GliFFwfQ6NoZ7mYSuhC/Em1F15Cyrk8SEEQ6l0kRyf9tjf5YCVecg/B7NIFqvGjmeg==
X-Received: by 2002:a37:a611:: with SMTP id p17mr4713622qke.669.1639833407498;
        Sat, 18 Dec 2021 05:16:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4613:: with SMTP id br19ls5915920qkb.6.gmail; Sat,
 18 Dec 2021 05:16:47 -0800 (PST)
X-Received: by 2002:a05:620a:2886:: with SMTP id j6mr4590346qkp.316.1639833406751;
        Sat, 18 Dec 2021 05:16:46 -0800 (PST)
Date: Sat, 18 Dec 2021 05:16:46 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b05b3ac9-dec3-40d5-a754-f9b75507e1edn@googlegroups.com>
Subject: eth0 on RPi4 jailhouse-image
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1980_1608490814.1639833406188"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_1980_1608490814.1639833406188
Content-Type: multipart/alternative; 
	boundary="----=_Part_1981_1852986887.1639833406188"

------=_Part_1981_1852986887.1639833406188
Content-Type: text/plain; charset="UTF-8"

Hi, 
How to release the physical NIC from jailhouse? I mean I need the ethernet 
interface to connect to a network, and I would replace it with a virtual 
ethernet. The setup used is the image produced by jailhouse-image for 
raspberry pi4. 
Best regards,
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b05b3ac9-dec3-40d5-a754-f9b75507e1edn%40googlegroups.com.

------=_Part_1981_1852986887.1639833406188
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, <br><div>How to release the physical NIC from jailhouse? I mean I need =
the ethernet interface to connect to a network, and I would replace it with=
 a virtual ethernet. The setup used is the image produced by jailhouse-imag=
e for raspberry pi4. <br></div><div>Best regards,</div><div>Moustafa Noufal=
e<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b05b3ac9-dec3-40d5-a754-f9b75507e1edn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b05b3ac9-dec3-40d5-a754-f9b75507e1edn%40googlegroups.co=
m</a>.<br />

------=_Part_1981_1852986887.1639833406188--

------=_Part_1980_1608490814.1639833406188--
