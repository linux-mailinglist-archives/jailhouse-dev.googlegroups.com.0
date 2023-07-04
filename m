Return-Path: <jailhouse-dev+bncBCL6VO4KUEHBBW4FR2SQMGQEBDG7QJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08D746789
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jul 2023 04:24:29 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id 6a1803df08f44-635dba99f82sf54921376d6.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jul 2023 19:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1688437468; x=1691029468;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VU4aCaKrR9PFl6IpaNbiMZmHdpBNt2P5FSmhGF9OJf0=;
        b=EhcsSiyXq8R/Il4YhoPYajx2esxkwkopi2Dpmk3bonBkbuNeqOeqnutRklmtC0bC8G
         DJbxcl2bzlW95j+ISGN5f80NTpJh1MfRH8WlvgqSe3wVXuPsX1ppPr8fJ7+JfHuFLl2j
         TaxxInucG/jkActzlGPUSahv5m8bdLeu1Xp7gCdxjOuUt12XstU7Mf8U50cfMICxkhkm
         nUlGAvxNcTvEDMt4VwwxAwI6RR3tithVRnf8SGqsc6rMZC35qojgt949f5s3NANdSVg+
         yXCLK/PWqVc7+YTosvpTGQUH1buwSWeLhak5ql6PXu2xYmxii3dP0B0tiSA8eQEuu+mh
         1+zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688437468; x=1691029468;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VU4aCaKrR9PFl6IpaNbiMZmHdpBNt2P5FSmhGF9OJf0=;
        b=NVDSpWkO572yxfmVaa5OQbW7c5wHgyb+AvybpSNO2FdnySHKsXVwLtFNQ5aobIg5Ty
         iZBlcEBtPst8S+ZxL5VwtuiX61mRU62xq661r+I/jor2lfettsKqU/FRkQookxOvPFfL
         r7kLyxJUhiEyYKQjC20vlN8D3NL/zW3qku6/2zpvF1KAGjlI7Xy7CvfBj6rhpP1NBcV+
         y1hARrfdd6zySQAaOxgwcwn9O2rjPTpppB67ly4U/TRrI5A9iAfdR+AEQeFTYowBR2rb
         ez8rbEkqt/pkkEjv0tgOJRxBycCdwdp9eYqSScteMr1n2QifXHrzRKlP01opDmpiX81E
         ZBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437468; x=1691029468;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VU4aCaKrR9PFl6IpaNbiMZmHdpBNt2P5FSmhGF9OJf0=;
        b=GdtJo86jvQmEupfhvMK+3e6bpnPYCflLLfcKtmquPSNmUATXMK7GUyOLCCXmPdl8ad
         LIkyyx94ARRl6tLs4Dr8P8z0BBLGCR9xK4vy4yiCc7o27/kZQFSk/27PfX/eaBdzMn6h
         WGRwVPMMWdXWBVnvcYw8LZCe55usJSzyBZ7Nw5RydjbguXr3Y+tiJAtNOAoXyXIoe28g
         eE3ibGzr3bZouxOwl8TSPwO0bBBuSNXrT8oQiuVjjWcbj47YFFxMTlZnCNRZjdcASG3W
         AIZICSWBp5UJPVlqVTvvCJYbpChAhjfnRDOdqC0uSFxVQLz8g3/a1noM8XvadQWV+FaV
         0f2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLZhUIrGi7urTOdd/d79wMTKi+8vsAMoO8ZNptFh17VvYAUNY7ao
	VIUH63S3DQlMiTgG3EIotpA=
X-Google-Smtp-Source: APBJJlFHsqq4qmaeAdSlHehmpAnvGepmLXiU5jQFBSfm2xMhSCw7O5FRes3lwrB2GZrM2iZ5VG9SNg==
X-Received: by 2002:a05:6214:400e:b0:634:fe71:de61 with SMTP id kd14-20020a056214400e00b00634fe71de61mr13806573qvb.44.1688437468393;
        Mon, 03 Jul 2023 19:24:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:8706:0:b0:66a:4b97:f89b with SMTP id i6-20020a628706000000b0066a4b97f89bls1007306pfe.2.-pod-prod-02-us;
 Mon, 03 Jul 2023 19:24:26 -0700 (PDT)
X-Received: by 2002:a65:67cd:0:b0:55b:583d:3fd9 with SMTP id b13-20020a6567cd000000b0055b583d3fd9mr7258105pgs.6.1688437466817;
        Mon, 03 Jul 2023 19:24:26 -0700 (PDT)
Date: Mon, 3 Jul 2023 19:24:26 -0700 (PDT)
From: meiyan xiao <meiyanxiao0319@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <23a847d5-6d75-4ed0-986e-6d58405abb83n@googlegroups.com>
Subject: run non-root cell by SD card in RPI4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13248_1391903149.1688437466003"
X-Original-Sender: meiyanxiao0319@gmail.com
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

------=_Part_13248_1391903149.1688437466003
Content-Type: multipart/alternative; 
	boundary="----=_Part_13249_1304772308.1688437466003"

------=_Part_13249_1304772308.1688437466003
Content-Type: text/plain; charset="UTF-8"

Hi, I have already boot the 2nd linux-cell from rootfs.cpio, but the 
function of the linux is very limited, so I want to try booting the linux 
by SD card, could someone tell me how can I run the 2nd non-root cell 
(linux) by SD card in RPI4B?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23a847d5-6d75-4ed0-986e-6d58405abb83n%40googlegroups.com.

------=_Part_13249_1304772308.1688437466003
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I have already boot the 2nd linux-cell from rootfs.cpio, but the functi=
on of the linux is very limited, so I want to try booting the linux by SD c=
ard, could someone tell me how can I run the 2nd non-root cell (linux) by S=
D card in RPI4B?

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/23a847d5-6d75-4ed0-986e-6d58405abb83n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/23a847d5-6d75-4ed0-986e-6d58405abb83n%40googlegroups.co=
m</a>.<br />

------=_Part_13249_1304772308.1688437466003--

------=_Part_13248_1391903149.1688437466003--
