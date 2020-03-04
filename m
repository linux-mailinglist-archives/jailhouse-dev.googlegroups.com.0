Return-Path: <jailhouse-dev+bncBD5NBJN5TMBBBJOX7XZAKGQEHIG7VLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3a.google.com (mail-yw1-xc3a.google.com [IPv6:2607:f8b0:4864:20::c3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B57178CC5
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Mar 2020 09:49:43 +0100 (CET)
Received: by mail-yw1-xc3a.google.com with SMTP id a4sf1448007ywe.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Mar 2020 00:49:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583311782; cv=pass;
        d=google.com; s=arc-20160816;
        b=SMxgtfVu5xK+Gab8rJvu7caDb2QpMNDFA3xQPZsNxMv181/viJYkyl7pjSslLUvekx
         cFrb+7TktmiPyAfumkCCThBcMklIL6+7Q+Obbbsa4+b7coQxtJOziSrRFdzK30U5CZMm
         /p7Ok8MpWHM5X59u0beOjaLj1ZxbVNZDArcUgrGgdClfGfhFn/3IrkgIo1IE01Ylv4CQ
         JQe8M0QA/Q6YUQrqSLgIDoUZnvc7lhhW86r6doHwUODi6E/J51X5xYvs6KjfkqjsGMc6
         Xq7S7VWg+Fde3+h3v13oq6f5xu9+PJGFZsulvySGK/M06oco2iJRDt4UrTjww1hsfvkx
         c6uA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=ODM4vaAqpdovnCCa47Nj/Nm/iFRXziGtE5c2966ClL8=;
        b=w9kPuunszA+73T2T3bm+EBxKkwuwrchji5G4PJd3n+9wim5gC8xTQmsq8xfe0g5y3A
         T8pSsdaGxpSiZc76Qd7Tzlgp23bfaRcpe5uPo71TxefN0YZLfMXKa/7KYeGIk85fdIF+
         WoEdEq4j98/1PuJjUa8GB0ARiwNBxd50r1A9n0B0UgWzg7v8AWt2x9W4EKs9S5Ppm1UP
         1etRDUv31Cr8Hs3u9NuRAamw6KkBzu2aJkeM93UYApBN25vT4q7LZgdOv7BP/nmxubSA
         RGBtdcZNhWmpopHf6wWSylGy+xzgtq6tj2+KKXmfb2SeJvWJPl58qRDvprVHtRaWHGvT
         UAwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JYPeMl63;
       spf=pass (google.com: domain of aelshreif7@gmail.com designates 2607:f8b0:4864:20::d33 as permitted sender) smtp.mailfrom=aelshreif7@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ODM4vaAqpdovnCCa47Nj/Nm/iFRXziGtE5c2966ClL8=;
        b=sSmiNk1Dv1blCYSGIFoo7lh0bsNqqZdBULx2LHO7UgvwGF1xImymQHGHCWuE4fChrO
         KqKRQrJlzEjP/N7fBj0UXXRUfmsLaKY2SzevC6rKD/2SopA8lGNP3I4DSrNXeuoN/ebv
         8Ql5g929/DESpbqPQ0BhDgY5eVZrNjFxHsVPuMsfkhl67hherM14IZpQBdajmV3X3TQU
         4Bv7aU4v6SmX4cuHGPK03A3e3kgoSx47bhQWhAO9V1Ldiy9PLxf4IrCbKcTj8XwAzCyg
         36/3BGnZPwzjqbkaQQHLJXVyFZr6cYG/vDnIRB0xvtEtkmuuL4QxNy2K3rXJCg6duqxe
         vN5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ODM4vaAqpdovnCCa47Nj/Nm/iFRXziGtE5c2966ClL8=;
        b=pROBs9AOeovndPJUTo7fgudeG/1CwGYUWyVFjqbZU3HhpUzw2yArJo4VippC85evm5
         +eu5ajsg0/KscTyDcaQXPm+ze9ljTCKM5HeVyH9qWlgVdRc/QyZpAY0+3LjwBQi0sWRY
         578X5IKTXSOY/rbUcKn50pIIzP9bvLS8lGH8L3AIGkTDQ4IE1ndX60GibnEbqJtPiPgt
         yo6YwZUdbSSc7qb/RaVfYVDG/GtGJnoo+uS0jv0eIEnGD/onR2ONZkKZvvCDW8BD5MvE
         YrAxRZLJSiEpplkWt0ercQ3QruGhYqdgJ9ByMDo3g3GGAK4lIYt7nco9+EWBUxRY7Idm
         KNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ODM4vaAqpdovnCCa47Nj/Nm/iFRXziGtE5c2966ClL8=;
        b=Zp7/zWrgpA+gKerHDJOBHERjiwGdasJgkcv/+yYn/7H55mw6Hr6e1nc2D8D7CGGjsh
         4TLitJSYkQ22yV+wB0DbEq5QczJqU0fCpeLw17G0f1Xm+x3uGcO1nuZ7csDtoQGKkmrH
         xXcIrL2fopLprXaf/L6rx35VAUqAuEFUhJ6HvQjnXS0OR16NdJp1/QgEVwHkXBw0dxSy
         zs/KQwyQKqi4ztXHejzU+hVE6B+dc8ywwR0sYyLPUY8laS2TikaXfux04YdXz4cN/rqF
         EhDmSQnOXP+Zb1CYFfXdMXkQWcizOyJ4zG4pHf0LDlMZxt5MvhsJoc/RUVA+2ulwbBVl
         PXbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1iwC8ATgi3/FkfhgElsbiXMFlkYlR6WLRrlgTVQKf5eAWAlDv+
	mnmRBr9SGbpCzKQRdLLjYzA=
X-Google-Smtp-Source: ADFU+vvCU87jktGuXcp3v3y7uejgbdjEC8FiGI2dA+MPdx5PssbevyzyonIEebfNuYCBywSvob3Tcg==
X-Received: by 2002:a81:1ad5:: with SMTP id a204mr1872010ywa.122.1583311782117;
        Wed, 04 Mar 2020 00:49:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:a084:: with SMTP id x126ls273648ywg.7.gmail; Wed, 04 Mar
 2020 00:49:41 -0800 (PST)
X-Received: by 2002:a81:5785:: with SMTP id l127mr1884495ywb.178.1583311781593;
        Wed, 04 Mar 2020 00:49:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583311781; cv=none;
        d=google.com; s=arc-20160816;
        b=GfG0uSHkW39LKWh4UEgbqEtnpwFGscnvXPxoRiY6Miw0fwnMp+Kc9fFEZWE+362qdX
         SuE2zuGMHorTScFO8Y19KLI7cS3dClSTL8fEcIMsUyGY3SzIVCfqd29RrQrZVJr90xQP
         SdcHZOr2MMBC17+2dD6ZtM6FFerI2BjUo+HTg0OiQT/iDPa5z4ASGF6lPcVJ2K4fvj2L
         XgWbhjA3kee0OpvYGUFmTg3Pa05DTSK8fkpRAXhxkETbiV8TCPMMi5ZDLN+e8bM4itZH
         mK74shhQfQS1uXPN7AWmG+kg6Y1ASCM9RBgoiBXzexkUGsfyt/OPMTe47HRy5gO0fjor
         mCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mHacn3CVliJZhiGFSii6Kh2Etkb09ZRgJshIX7dahkw=;
        b=VPdI76+yX90LcT+6DikxvoQFTA4d8q9ve7hRf0yl//cy9QA4uqzipnrrHK6h5enDHu
         pC9k+y1Y8P3iymhbxairBL5iRgVJc/mJk14H/EZbJudTBSLf0+4G1/UVOzQVLaMVK1f+
         7hfkf93btCMUrUhurMQ3b9QsVsMnvRN3O+VMJMReObwVydG4PhO7FqkxC1bUMz5rUgad
         61bqFgPx+l+ioBNH42NrJZq24m/aq7oCiF3fZ5hMdyx2P0uwgv6ln7YA5NboxrPrZyM9
         8BC9rh5aMxnpQ0a7FOTHKFRMOJ6RE3xlmQFkGZRpIXpxGrqjFMmWEWR25h2oviD1djV3
         DDMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JYPeMl63;
       spf=pass (google.com: domain of aelshreif7@gmail.com designates 2607:f8b0:4864:20::d33 as permitted sender) smtp.mailfrom=aelshreif7@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com. [2607:f8b0:4864:20::d33])
        by gmr-mx.google.com with ESMTPS id u7si104919ywg.5.2020.03.04.00.49.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 00:49:41 -0800 (PST)
Received-SPF: pass (google.com: domain of aelshreif7@gmail.com designates 2607:f8b0:4864:20::d33 as permitted sender) client-ip=2607:f8b0:4864:20::d33;
Received: by mail-io1-xd33.google.com with SMTP id n21so1487451ioo.10
        for <jailhouse-dev@googlegroups.com>; Wed, 04 Mar 2020 00:49:41 -0800 (PST)
X-Received: by 2002:a6b:a0c:: with SMTP id z12mr1264392ioi.92.1583311781083;
 Wed, 04 Mar 2020 00:49:41 -0800 (PST)
MIME-Version: 1.0
From: ahmed El-Shreif <aelshreif7@gmail.com>
Date: Wed, 4 Mar 2020 10:49:30 +0200
Message-ID: <CAPkDTbCy_BBCuvNsd8ZLAYtC=OAjY5E1mvqh-Sw==YS=m5TetQ@mail.gmail.com>
Subject: GSoC 2020
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000047bf9305a003800d"
X-Original-Sender: aelshreif7@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=JYPeMl63;       spf=pass
 (google.com: domain of aelshreif7@gmail.com designates 2607:f8b0:4864:20::d33
 as permitted sender) smtp.mailfrom=aelshreif7@gmail.com;       dmarc=pass
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

--00000000000047bf9305a003800d
Content-Type: text/plain; charset="UTF-8"

Hi,

my name is Ahmed. I am a Computer Engineering student from Egypt. I am
really interested in contributing this year in GSoC program with Libvirt .
I was a GSoC student last year with LibreOffice. I was working in a
compiler project. I want this year to work in new project. I found your
projects interesting for me.


I have skills in c , c++ and python also I know Linux very well. I need to
understand more. where to start or can you recommend some easy bugs to
solve to get comfortable more with the code and to put goals of the "Libvirt
driver for Jailhouse" project.


Thanks,
Shiko

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAPkDTbCy_BBCuvNsd8ZLAYtC%3DOAjY5E1mvqh-Sw%3D%3DYS%3Dm5TetQ%40mail.gmail.com.

--00000000000047bf9305a003800d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">my name is Ahmed. I am a Computer Engineering student from E=
gypt. I am really interested in contributing this year in GSoC program with=
=C2=A0<span id=3D"gmail-m_-1099965560309170728gmail-Libvirt_driver_for_Jail=
house" style=3D"color:rgb(0,0,0);font-family:LibvirtOverpass;font-size:1.2e=
m">Libvirt=C2=A0</span><span style=3D"color:rgb(0,0,0);font-family:LibvirtO=
verpass;font-size:1.2em">.=C2=A0 I was a GSoC student last year with LibreO=
ffice. I was working in a compiler project. I want this year to work in new=
 project. I found your projects interesting for me.</span></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">I have skill=
s in c , c++ and python also I know Linux very well. I need to understand m=
ore. where to start or can you recommend some easy bugs to solve to get com=
fortable more with the code and to put goals of the &quot;<span id=3D"gmail=
-m_-1099965560309170728gmail-Libvirt_driver_for_Jailhouse" style=3D"color:r=
gb(0,0,0);font-family:LibvirtOverpass;font-size:1.2em">Libvirt driver for J=
ailhouse</span><span style=3D"color:rgb(0,0,0);font-family:LibvirtOverpass;=
font-size:1.2em">&quot; project.</span></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">=
Shiko</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAPkDTbCy_BBCuvNsd8ZLAYtC%3DOAjY5E1mvqh-Sw%3D%3DYS=
%3Dm5TetQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CAPkDTbCy_BBCuvNsd8ZLAYtC%3DOAjY5E1=
mvqh-Sw%3D%3DYS%3Dm5TetQ%40mail.gmail.com</a>.<br />

--00000000000047bf9305a003800d--
