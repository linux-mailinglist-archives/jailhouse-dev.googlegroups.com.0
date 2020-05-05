Return-Path: <jailhouse-dev+bncBCHKZ6U5VMPBBSGNY72QKGQE3RE2WPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93e.google.com (mail-ua1-x93e.google.com [IPv6:2607:f8b0:4864:20::93e])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BBC1C63D3
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 00:20:58 +0200 (CEST)
Received: by mail-ua1-x93e.google.com with SMTP id c24sf1457365uao.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 May 2020 15:20:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588717257; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mu+nJqk313WU78LMpquUbYm02+ffdOufZoa8POLTE6PTXt0E/PF7G/wapovtOljx1Y
         Z9Z0ccSJJcaGpUYh9Ss/OsJUBBT7uOXkqUmHbtBwYmGUXKMOOZvb0gfmCljgSIknoDox
         /cSss8f/mx3rU9Ga/J97A3mjVkem3FRW1Y49C7nxEqen3K9SIeyZnMi3PJZ4baBaobAm
         0oEWcZF9R3z1P2861qoVDzVgvTcsDkq0TUvAxyYDLECpbqHGqJlArMxJldKTD2+odQxx
         cj5GMHC/G6PlcFAoOxMaXymWzqcrzoj7bYo3LwGZFNKR7MbZ3UtkvvYyerBJ/smphKSz
         ++Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=aGZbLcxlQ6S/I61Ur9O0/d0EvBgtqoebREmRTk8dGNE=;
        b=WBMneIAutIw5dYVWBjJmlaZ2QdEWxFjozC5YGea4xIIIPYznAvqNSAVt6vgZ/vxg1p
         Qii4msu3gJZ/5oHz19XHK5+NabgmjoXkMCJOpmHJ8AbEDbN6GEWumG6aOe3lROuVnjNk
         geWngkdNZoUUbS3+8lD9g3wj8hDFzqNMUOMjLzl7SCodGPccoCsUb8uVYR8v7laDw2aV
         aAz3oeqH/sh9C9Iae6GnHIhpt1jWp/WAv5p7b2hAAzDBTEInUvNJPFyABO6VTJSxxBt+
         7zzxNEwX21WfEWyy1tiBYodGpmeY1P3RWAfSm6+9+YSDMNPpT0RqaC804j40VdZiqfj8
         7c7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=a1zOSjLx;
       spf=pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d44 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aGZbLcxlQ6S/I61Ur9O0/d0EvBgtqoebREmRTk8dGNE=;
        b=pi4WCV4tcNcw06EbAu6H7DAz8ZbESN9ulPTFP6TjFyz6DGn0jXhdMLUTQa3YjJdNIs
         mafOHlfj/Kz5HrWyFDC5XJ4E2ClHS3uS/FP64EHoT9Y5c82rW1pH4/cqM5YCou1lERdI
         penGh93pR5nm1gEz8/DWZm9DIJeK5XROWVaquPRfdIUxvTTno8uh468dMGS1kfZ0uYXv
         w7qHGuNWEgs5KMNq1zAd3Td+aYjCVBQflym+czcFlRbx8PnYUoFLXUVLIuRaP72e4JCq
         c0CDx/9kkuQibTMIQ/vcGuod7aLY/THJnfkUPuZRQLqF7bfPydGxKkSDlykpBjvHZuyQ
         X0RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aGZbLcxlQ6S/I61Ur9O0/d0EvBgtqoebREmRTk8dGNE=;
        b=sLAYsWGBv4MdjlaG2A9S3KnciGmyWUFK2LDFnKsEsBRQj8UtVcLLguqpAnD7K8AEXv
         BhVHuUVGdm58WEDwsaI++VxA6GT/uoZO5Thv4MFrdkOpDbr3P09gH3uJPDyg9R5LkIb/
         CM033kvyQ2wTPH07dxJYxVl1no5Bn93Bka5dP182V41MZfNbfzEun44VysRJyymWrUS7
         3hr4ep0n0prJ6ruNtOf8mVUTAjYs+mbgNggdnYefzh38hv9scFZsBVUCnJMYiYkiv7p4
         hJEhTwqdHpxPI76yNTzap8FUr4WpVuuRIX87d3Ye/SK0LJbkLaNocL9pQHQDY0pJWJT4
         tReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aGZbLcxlQ6S/I61Ur9O0/d0EvBgtqoebREmRTk8dGNE=;
        b=EXIIGiYR/eCXN64N/XuTOt17QQM/33Ck5u2uiO3uy5khk+nl83XEstU1qaj7d8GtOm
         hMvfiDadzDFJuB9ElltAF6NuWrNo7tY1m43tya24pn+ygSQyYx0PA8/h8AKx7FJKiMaM
         KczkhjXfRUKN2wfu2FgS6Qcj1MUVX1JGvhPoJNCYxoseOyOQtyR6lnFSvRw+m17KCUW5
         Qg9YwGxnpKjyi8DyWXTGIMu0kKo1XOMunWufqYt9Yf6MfiY5gBXkOklBL3r3UCwGVhAo
         3EvIqxkZfVDFp+jRM7IgyhLIO0KERDI/EpKgTfsOpz/cuVDVmaFUm2wvCu04yJBFY153
         KlEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZWHIoOmgSSfInwXhj1eMxF3JP5hz6oZrP424Fitx9Rbja2Hycq
	4PUfmrwtgGlIlF3zIcPZ4qU=
X-Google-Smtp-Source: APiQypKfgX5QoK3hpuwesESQR9Dhzz44i0X94lDJ6itKGjMUp0RfsFCAcK9XRN2mRTjo9NkI3JSG0w==
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr5431205vsp.83.1588717257175;
        Tue, 05 May 2020 15:20:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:b14c:: with SMTP id z12ls688162vsl.0.gmail; Tue, 05 May
 2020 15:20:56 -0700 (PDT)
X-Received: by 2002:a67:f258:: with SMTP id y24mr5241154vsm.112.1588717256644;
        Tue, 05 May 2020 15:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588717256; cv=none;
        d=google.com; s=arc-20160816;
        b=vHJhVrgQ052p6N7Cw1T7oxHA4NFkHQGdS1O4Vrz6CaGbYHRIKqoE+Nr1Tuy941LdNi
         Eb9PMTCCJgjB7PSMIp5kWcQTXBXGUGKRtQJrXiMls27EeLOGFv70qzK0F2g6+wE48p7d
         qCiO3GQVrXOZ5nDfVe66ICyoderKH+Wyf4a8Er5k5ggq/Wi1ZTQzk2a1xDGZB+NQk4Wy
         ImMoM3X56+7El+JhSn4bfaw5gWgrmyIR4GUQSxvR+gwWV2EC5YreEfLwoN9/X8qtHrys
         SRW3LtNz4sZz6ZIapdxGSMNneKtTja0ZyY+zvA6iiRy5XgEuNcwvPlyeuBfQmeMaokTZ
         an2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8lxfyEeZIWylMBBLimSx+x9i5X4ii58Ry2ybEw+5voA=;
        b=eVgh8/lbeTZql/O5qoguqh0L9VpOyiMPM/7tG1lNcEKQY7lNCD2ss6MLQPXYnivRXD
         fQWY7Ph5rISNs0smY3vnfGeHoksrsQfgCTJCacJnox7rlNwMx1qx73TnlVhkB4jaf2Z/
         uXB91x3y6Eoa2Hmp649Q5rG7ISx4v6e6aHO4oKM2IvUTbpabJ3OZuNxBegjAgw7VpvjL
         Ftm7uVCDLuotyr7T3AUtVclBSkBLP9w69ug4+srqiiX6Rgfs2nISdU4VnanX/niV04yH
         2PIpeg3F+b5+5VaFxI59ZXHZmNYZ8wEL7lJVBTL/sXU62oN8DIDoKkYXbBfe/lwL+Nfm
         IwTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=a1zOSjLx;
       spf=pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d44 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com. [2607:f8b0:4864:20::d44])
        by gmr-mx.google.com with ESMTPS id i26si22085vsk.0.2020.05.05.15.20.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 15:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d44 as permitted sender) client-ip=2607:f8b0:4864:20::d44;
Received: by mail-io1-xd44.google.com with SMTP id z2so55179iol.11
        for <jailhouse-dev@googlegroups.com>; Tue, 05 May 2020 15:20:56 -0700 (PDT)
X-Received: by 2002:a02:9642:: with SMTP id c60mr5599535jai.87.1588717256076;
 Tue, 05 May 2020 15:20:56 -0700 (PDT)
MIME-Version: 1.0
From: Emilia Kudrina <emiliakudrina@gmail.com>
Date: Wed, 6 May 2020 02:20:43 +0400
Message-ID: <CABnRrYfKq8t2pRm4d7M1fqKP9L9Bx4Bv3zk8GfQirV0DY49kEg@mail.gmail.com>
Subject: My main update
To: developers-list@mycompany.com
Content-Type: multipart/alternative; boundary="000000000000b28e6705a4ee0f23"
X-Original-Sender: EmiliaKudrina@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=a1zOSjLx;       spf=pass
 (google.com: domain of emiliakudrina@gmail.com designates 2607:f8b0:4864:20::d44
 as permitted sender) smtp.mailfrom=emiliakudrina@gmail.com;       dmarc=pass
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

--000000000000b28e6705a4ee0f23
Content-Type: text/plain; charset="UTF-8"

Hey, Dear Community

I started a new Youtube Channel & kindly ask you to check my videos and
subscribe to my channel, if you like it.


*Subscribe to my new channel by https://www.youtube.com
<https://www.youtube.com/c/TravelerNewsGroup?sub_confirmation=1>*


with love & best wishes, Your Emilia!


[image: Mailtrack]
<https://mailtrack.io?utm_source=gmail&utm_medium=signature&utm_campaign=signaturevirality5&>
Sender
notified by
Mailtrack
<https://mailtrack.io?utm_source=gmail&utm_medium=signature&utm_campaign=signaturevirality5&>
06.05.20,
02:18:48

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CABnRrYfKq8t2pRm4d7M1fqKP9L9Bx4Bv3zk8GfQirV0DY49kEg%40mail.gmail.com.

--000000000000b28e6705a4ee0f23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><font face=3D"georgia, serif" style=3D"color:rgb(0,0,0=
)">Hey, Dear Community<br><br>I started a new Youtube Channel &amp; kindly =
ask you to check my videos and subscribe to my channel, if you like it.<br>=
<br><br><b><a href=3D"https://www.youtube.com/c/TravelerNewsGroup?sub_confi=
rmation=3D1" target=3D"_blank">Subscribe to my new channel by https://www.y=
outube.com</a></b></font><div style=3D"color:rgb(0,0,0)"><font face=3D"geor=
gia, serif"><br><br>with love &amp; best wishes, Your Emilia!</font></div><=
br><br><div id=3D"mt-signature">
        <table border=3D"0" cellpadding=3D"8" cellspacing=3D"0" style=3D"us=
er-select: none;">
            <tbody><tr>
                <td>
                    <a href=3D"https://mailtrack.io?utm_source=3Dgmail&amp;=
utm_medium=3Dsignature&amp;utm_campaign=3Dsignaturevirality5&amp;" class=3D=
"" style=3D"text-decoration:none">
                        <img src=3D"https://s3.amazonaws.com/mailtrack-sign=
ature/sender_notified.gif" alt=3D"Mailtrack" class=3D"" width=3D"32" height=
=3D"32">
                    </a>
                </td>
                <td>
                    <span style=3D"color:#777">Sender notified by</span> <b=
r>
                    <a href=3D"https://mailtrack.io?utm_source=3Dgmail&amp;=
utm_medium=3Dsignature&amp;utm_campaign=3Dsignaturevirality5&amp;" class=3D=
"mt-install" style=3D"color:#4374f7">Mailtrack</a>
                    <span style=3D"color:transparent;font-size:0">06.05.20,=
 02:18:48</span>
                </td>
                <td>
                   =20
                </td>
            </tr>
        </tbody></table>
    </div><img width=3D"0" height=3D"0" class=3D"mailtrack-img" alt=3D"" st=
yle=3D"display:flex" src=3D"https://mailtrack.io/trace/mail/dc9c0ed0705e4ca=
6c90bf0a1b1c431d40e520681.png?u=3D5585490"></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CABnRrYfKq8t2pRm4d7M1fqKP9L9Bx4Bv3zk8GfQirV0DY49kE=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CABnRrYfKq8t2pRm4d7M1fqKP9L9Bx4Bv3zk8GfQirV=
0DY49kEg%40mail.gmail.com</a>.<br />

--000000000000b28e6705a4ee0f23--
