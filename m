Return-Path: <jailhouse-dev+bncBCWO5NWWJAIORA4NVIDBUBCRLO3VE@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 383207DECDA
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Nov 2023 07:30:03 +0100 (CET)
Received: by mail-qv1-xf3e.google.com with SMTP id 6a1803df08f44-66d159f725csf7447896d6.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Nov 2023 23:30:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1698906602; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ltnkx0DU8/H0cV7qU8CcXixu32YnANaydFg9D7Bb0YkVHe1N4vvPxLBu9vcXAEnjHq
         wBgrPq6NMxnDuGf+O5bcwkFJj4zuL3gdUVOUanlVuI/AIvH8MWrVCRbXS+BXurqgp45F
         WRI5SZbBdmaYK+PxhBAcAfOMUynOQmi7NCqe8Ip9syOF2tFt7Kr8r0f0PWzI4Hh6XINq
         0+91w5xcyTSBAR4uq0Yput7oJPQl1/8FVN1EOECBOtWqP9cSYEW4PlV2WQMShn0c0fAz
         77mkdDqTeIJkiFP0fWb0E2iMXaIvckqHCIT+dg74/7SpK9JQjYjQQkEklF2zDg6YURdd
         5jsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:to:list-unsubscribe:subject:message-id
         :mime-version:from:date:sender:dkim-signature;
        bh=ZS/v6rawbi/4GzPmaU+fhptFhCAG17cpBPTpt5lmofY=;
        fh=2tQzQ7BDCTqJm82PDY7f/SoNACc8xWmtm+Icohy5zLg=;
        b=XRjOZlk+7xMaZT1cchOWb59ukIf8X7osf5rnPU8FmsChAjIo5FQ4VqAGctt/uyt7uC
         rvjz742AUoZn9u2MwSSYLaEuxf/JUsv71ZPAXnZryk6kz1B+sNatAXh8I4yRr4No6lKg
         miX8M7rrTwJ04XNxMQkhJLl66h7xpYJ5IM7MBxKA5Mf6Rzr281EOxMjMysTWHpmCXwuW
         F9s3/UAGE5hZqOCcQNVCS6bKINwad4yHdFotng0FKMRbqw2Z5x6x2mVkjK7IBjlqW9qe
         EqdOywhUAmuD+XYStkAXqi0lptXTWPpfXafdA0L9pH/E9xOqbLkcFnjNppAMIAa1pPOW
         ityQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ksd2.klaviyomail.com header.s=m1 header.b=Iucs+Mqu;
       spf=pass (google.com: domain of bounces+37144610-00a2-jailhouse-dev=googlegroups.com@send.ksd2.klaviyomail.com designates 149.72.183.195 as permitted sender) smtp.mailfrom="bounces+37144610-00a2-jailhouse-dev=googlegroups.com@send.ksd2.klaviyomail.com";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=priveglobalevents.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1698906602; x=1699511402; darn=lfdr.de;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:list-unsubscribe:subject:message-id
         :mime-version:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZS/v6rawbi/4GzPmaU+fhptFhCAG17cpBPTpt5lmofY=;
        b=HLYx+v1TefOw2h9H8hx3pXKssZUije77P4c8daRCRlXc+XioNqADUm7/hVsMB+xt8d
         p8wc9eR6ZHPrAWNfLVKjk9rbSa40CFDqECXXToHWDu8abyT/5WFlRyCeJ+NHs65P77k0
         Xx9K2T0FYEBkw99siSIP1/Wb9uwRPFNN2CKyB8oT32wImHMF3iIm4r6omHJJn3aEOpM5
         mjwveO8kE8+v2ADgSM8jnb55Z2q5zf4B7/hRfPjqr0iOstVFcSIzLNgtWRxgBwPUBOJc
         ZQoKLUqUO946Q3B6htC7cTh2+xB6UPYZw2VY3PBX1MJy6g4tCUx6pCGu9/tg+ubHb2bx
         XcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698906602; x=1699511402;
        h=list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to
         :list-unsubscribe:subject:message-id:mime-version:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS/v6rawbi/4GzPmaU+fhptFhCAG17cpBPTpt5lmofY=;
        b=FpBsdvM5Q808DaowCQG7fD5Gr9J79hEbyCAsDsSTNNRil3ENRA5oVrwGhlCW9CegbU
         UNtC488joEH6+jUKXdctbPH81yIJOdiEjYGJTkVsU+VAIe6Vp2QSLqau5wPB2/RtRf+W
         9fyiqfF5lCczWB75l4e8aGhk39EwpVJPuNnqPdg9GaVwKryuVawtXkHJCcRRCNS1VSWp
         pnYZKbSxxwxKU6PtL9gMoqdquFw5XOXl8sHd7cC09vr6FznX9hVkyhYv1TysH9wfp18R
         m1lLeJjjJykDuhGw0/Pa/5wtAKcT10rP58Q5k8Aq5NumJwKXD3uiaDC+y5ixMc3D2MXo
         ilfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxZGCoB1xkmk9Oa/cLd2eL0kCgrSdHuJc/YRJLoylZQhhBTpqjb
	h8guzCaQxQxHXSFZ+0oufnbz0w==
X-Google-Smtp-Source: AGHT+IGeY/UqAIjwgqAe2UNs/aqDBOLUtLsACQDJwUf0ukcvAfw1L/BgU7tAvWSqVvYMRpNlTalm7w==
X-Received: by 2002:a05:6214:d68:b0:66d:63b3:690d with SMTP id 8-20020a0562140d6800b0066d63b3690dmr26380113qvs.52.1698906601243;
        Wed, 01 Nov 2023 23:30:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:14d2:b0:419:8ce8:251d with SMTP id
 u18-20020a05622a14d200b004198ce8251dls652568qtx.1.-pod-prod-01-us; Wed, 01
 Nov 2023 23:30:00 -0700 (PDT)
X-Received: by 2002:a1f:298a:0:b0:49b:adce:e2d1 with SMTP id p132-20020a1f298a000000b0049badcee2d1mr17203715vkp.10.1698906600119;
        Wed, 01 Nov 2023 23:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698906600; cv=none;
        d=google.com; s=arc-20160816;
        b=sIl52f6eF+stPER6ni4bXFxsMmBkD1dqXq84OHYDUN3tp91h6gy4sMFZsI60irT3Yc
         c2ZKCVBh0JltaoQUQExKZmi0hYN78CbNISKFzOllLQuqjNt5JwrwNcwoi5pWMaqtvNl8
         PxPx1pUCuesSz/fR3UUmG0t19wiqdCjI9/sGpGVHd7xBW1kx2VxN1XC93TfjWirGTaeD
         RjW1R8VfgBkzEn/2XaGnADjE5JL4uJxvjThT4R6FSy7zJFpbC7J0qG6dYEORbnHFLdjH
         A6fPTByC9IUtqH5TVcNhD6xBZjZVHlx5i43Q3U9srKhN8EKQXj9OfpcW9xr4cfsR3kVt
         RSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:list-unsubscribe:subject:message-id:mime-version:from:date
         :dkim-signature;
        bh=y0SAIIbKh/jRLYx7seyYGQk+1rZepk/l2eNdN6PRiWk=;
        fh=2tQzQ7BDCTqJm82PDY7f/SoNACc8xWmtm+Icohy5zLg=;
        b=QEJOA6YIJw2sinJ+1p1M6Qou5Mn51PYNAwj/KjNukubA5SxkR6jLkWlvqXpEQvMwEP
         nkrsLmmhY9li9R6nuHGNlc3+gTFY2xJu2ykaiL0InPMKmWzQXBG2fo59tPNs6+OwY+pz
         Nea94mOma4Lxi058/e9Pc0ZZPbIMm31QzHpJIhjx5R054FpP4JDTRLuSQ3EDXPINrXfv
         9cKukeGd3eLLOsrlbCe0HQKB3nsPPbMcpF/l+vFITriabuk1Q3kbL5P9L35T9TgTj7yE
         7ZgbcWvziEO5bZnwyLDnvLodDlSYapIVhkr2T4FvPshzcNqA7oPPX0wC5qT3j2q2DJfR
         11qQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ksd2.klaviyomail.com header.s=m1 header.b=Iucs+Mqu;
       spf=pass (google.com: domain of bounces+37144610-00a2-jailhouse-dev=googlegroups.com@send.ksd2.klaviyomail.com designates 149.72.183.195 as permitted sender) smtp.mailfrom="bounces+37144610-00a2-jailhouse-dev=googlegroups.com@send.ksd2.klaviyomail.com";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=priveglobalevents.com
Received: from o1366.shared.klaviyomail.com (o1366.shared.klaviyomail.com. [149.72.183.195])
        by gmr-mx.google.com with ESMTPS id di24-20020a056122469800b004937daab34esi271155vkb.4.2023.11.01.23.30.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 23:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+37144610-00a2-jailhouse-dev=googlegroups.com@send.ksd2.klaviyomail.com designates 149.72.183.195 as permitted sender) client-ip=149.72.183.195;
Received: by filterdrecv-7d848c6fdf-7pr6t with SMTP id filterdrecv-7d848c6fdf-7pr6t-1-654341E7-93
        2023-11-02 06:29:59.784183134 +0000 UTC m=+1338492.533777049
Received: from MzcxNDQ2MTA (unknown)
	by geopod-ismtpd-0 (SG) with HTTP
	id ZdgYI3dIQ0q6uSyyGMl3YA
	Thu, 02 Nov 2023 06:29:59.745 +0000 (UTC)
Content-Type: multipart/alternative; boundary=34a15a1bca1a7af13a5ab40e35cf6db0d77074f3c561dcf02c63c866710d
Date: Thu, 02 Nov 2023 06:29:59 +0000 (UTC)
From: =?utf-8?q?Priv=C3=A8_Global?= <daniel.derusso@priveglobalevents.com>
Mime-Version: 1.0
Message-ID: <ZdgYI3dIQ0q6uSyyGMl3YA@geopod-ismtpd-0>
Subject: F1 Paddock Club - British Grand Prix 2024 - Cancellation
X-Kmail-Message: 01HE5X778QAKB9TZ3008A1Y067
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-Kmail-Ops: 01HE30JKD2B09WMSYV4K5SDYM1
X-Kmail-Account: W7Aufs
X-SG-EID: =?us-ascii?Q?DGcZZNCRQeVLUwJuE4Cjtrl0pQict+xa7IzNxh6pJ0SZ+XCfg=2FCZcXcbC+f+oL?=
 =?us-ascii?Q?Pd3RqTPHF4jRmxN+3ixMaLOz+dxqTI5aVOD=2FeuW?=
 =?us-ascii?Q?NyjtiwpA+fuNSdyVKwEEBvBzLFoydtw4L4mde2R?=
 =?us-ascii?Q?MZwGCMpBsyBC0YQhuKRt2rUMcMGRbg16P5Dd6gl?=
 =?us-ascii?Q?SdvFAOdkM92fFYSBGkVPwr0D=2FhQYZoJDnzTWFYN?=
 =?us-ascii?Q?G+9PVXmy6IFRxtTo22I1f0FmdQEfmCbIp5eMbI1?=
 =?us-ascii?Q?Mc=2FeS82MKjZPcYM16GrxCu9LCHuL2EdTuquounz?=
 =?us-ascii?Q?V9k=3D?=
X-SG-ID: =?us-ascii?Q?N2C25iY2uzGMFz6rgvQsb3WdckyvbC2eFaxvdDHn8D1nndBBW0fUClUlZF2fTQ?=
 =?us-ascii?Q?6Kv82ctdcz4tvgaKE=2FDnYGx9a749OagguRwNEO3?=
 =?us-ascii?Q?7MRU7HEjD9UuiFNMkNkm3ZWsa=2FVE7+RutCNJBAB?=
 =?us-ascii?Q?k+9Cuqd4oahMOUX5Qr1RmPYtnW+xiQApqyKQpkm?=
 =?us-ascii?Q?YNxNFhadyw7CGE2u+QnjqdWMGmrO7IX=2FCyDt5HI?=
 =?us-ascii?Q?GoXldnuXg4WoVJx90dE7HfOJ9OdL3obEfcnSyz?=
To: jailhouse-dev@googlegroups.com
X-Entity-ID: lWNL8z1cD0I+du/nkjMwCA==
X-Original-Sender: daniel.derusso@priveglobalevents.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ksd2.klaviyomail.com header.s=m1 header.b=Iucs+Mqu;       spf=pass
 (google.com: domain of bounces+37144610-00a2-jailhouse-dev=googlegroups.com@send.ksd2.klaviyomail.com
 designates 149.72.183.195 as permitted sender) smtp.mailfrom="bounces+37144610-00a2-jailhouse-dev=googlegroups.com@send.ksd2.klaviyomail.com";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=priveglobalevents.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--34a15a1bca1a7af13a5ab40e35cf6db0d77074f3c561dcf02c63c866710d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

Existing news for F1 fans, we've just had a cancellation on a private table=
 for 8 guests for the F1 Paddock Club at the British Grand Prix taking plac=
e at Silverstone between 4th-7th July 2024.

Typically, 3 days passes for the Paddock Club (with pit lane passes include=
d) are priced at =C2=A33k per person. However, we can offer these 8 places =
at a discounted rate of just =C2=A31,495=C2=A0per person +VAT.=C2=A0

Package Inclusions:

- Entry to the Red Bull Racing hospitality suite in the Formula 1 Paddock C=
lub=E2=84=A2=C2=A0with excellent on-track views
=C2=A0
- All-day hospitality in the Red Bull Racing hospitality suite with gourmet=
 cuisine and an open bar serving premium drinks.
=C2=A0
- Appearances by key team personnel, including race drivers Max Verstappen =
and Sergio P=C3=A9rez.
=C2=A0
- Guided tour of the Red Bull Racing garage where you can get behind-the-sc=
enes access to the team's operational strategies throughout the weekend.
=C2=A0
- Daily walks in the pit lane, where you can get an up-close view as the me=
chanics prepare the cars for racing.
=C2=A0
- Prime viewing from above the pit lane and team garages, looking over the =
start/finish line, with free grandstand seating available as well.
=C2=A0
- All day open bar serving Champagne, fine wines, premium spirits, beers, s=
oft drinks, tea & coffee.
=C2=A0
- Gourmet luncheon starting with a plated starter, followed by a sumptuous =
buffet.

=C2=A0

This is a huge opportunity to attend the F1 next year at Silverstone and th=
ese places will be sold on a first come, first serve basis.

If you do wish to make a reservation, reply to this email or give me a call=
 on 0203 576 4529 and I will be happy to assist you further.

Kind regards,=C2=A0

=C2=A0

Daniel De'Russo=C2=A0

Head of Global Corporate Sales=C2=A0

Priv=C3=A8 Global Events

To reserve this table, please do not hesitate to call me or reply to this e=
mail and I be happy to assist you further.

Daniel=C2=A0De'Russo=C2=A0

Head of Global Corporate Sales=C2=A0

Priv=C3=A8 Global Events=C2=A0

=C2=A0=C2=A0t: =C2=A0+44 203 576 4529

The content of this email is confidential and intended for the recipient sp=
ecified in message only. It is strictly forbidden to share any part of this=
 message with any third party, without a written consent of the sender. If =
you received this message by mistake, please reply to this message and foll=
ow with its deletion, so that we can ensure such a mistake does not occur i=
n the future.=C2=A0=C2=A0

Registered Company Name - Prive Global Sports. Company no. - 12537476=C2=A0=
=C2=A0

No longer want to receive these emails? [Unsubscribe](https://manage.kmail-=
lists.com/subscriptions/unsubscribe?a=3DW7Aufs&c=3D01HE30JKD2B09WMSYV4K5SDY=
M1&k=3D7854deb6cfe57f43bf0679033cf19b41&m=3D01HE5X778QAKB9TZ3008A1Y067&r=3D=
TLACycE).

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ZdgYI3dIQ0q6uSyyGMl3YA%40geopod-ismtpd-0.

--34a15a1bca1a7af13a5ab40e35cf6db0d77074f3c561dcf02c63c866710d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"
Mime-Version: 1.0

<!DOCTYPE html><html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:o=3D"urn:=
schemas-microsoft-com:office:office" xmlns:v=3D"urn:schemas-microsoft-com:v=
ml"><head>
<title>
</title>
<!--[if !mso]><!-->
<meta content=3D"IE=3Dedge" http-equiv=3D"X-UA-Compatible">
<!--<![endif]-->
<meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type">
<meta content=3D"width=3Ddevice-width, initial-scale=3D1" name=3D"viewport"=
>
<!--[if mso]>
        <noscript>
        <xml>
        <o:OfficeDocumentSettings>
          <o:AllowPNG/>
          <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
        </xml>
        </noscript>
        <![endif]-->
<!--[if lte mso 11]>
        <style type=3D"text/css" data-inliner=3D"ignore">
          .mj-outlook-group-fix { width:100% !important; }
        </style>
        <![endif]-->
<style>a:link {color:#197bbd;font-weight:normal;text-decoration:underline;f=
ont-style:normal}
a:visited {color:#197bbd;font-weight:normal;text-decoration:underline;font-=
style:normal}
a:active {color:#197bbd;font-weight:normal;text-decoration:underline;font-s=
tyle:normal}
a:hover {color:#197bbd;font-weight:normal;text-decoration:underline;font-st=
yle:normal}</style><style>#outlook a {
    padding: 0
    }
body {
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%
    }
table, td {
    border-collapse: collapse;
    mso-table-lspace: 0;
    mso-table-rspace: 0
    }
img {
    border: 0;
    line-height: 100%;
    outline: none;
    text-decoration: none;
    -ms-interpolation-mode: bicubic
    }
p {
    display: block;
    margin: 13px 0
    }
@media only screen and (min-width: 480px) {
    .mj-column-per-100 {
        width: 100% !important;
        max-width: 100%
        }
    }
.moz-text-html .mj-column-per-100 {
    width: 100% !important;
    max-width: 100%
    }
@media only screen and (max-width: 480px) {
    div.kl-row.colstack div.kl-column {
        display: block !important;
        width: 100% !important
        }
    }
@media only screen and (max-width: 480px) {
    .component-wrapper .mob-no-spc {
        padding-left: 0 !important;
        padding-right: 0 !important
        }
    }
@media only screen and (max-width: 480px) {
    td.kl-img-base-auto-width {
        width: 100% !important
        }
    }
@media only screen and (max-width: 480px) {
    .kl-text {
        padding-right: 18px !important;
        padding-left: 18px !important
        }
    }
img {
    border: 0;
    height: auto;
    line-height: 100%;
    outline: none;
    text-decoration: none;
    max-width: 100%
    }
.root-container {
    background-repeat: repeat !important;
    background-size: auto !important;
    background-position: left top !important
    }
.root-container-spacing {
    padding-top: 50px !important;
    padding-bottom: 20px !important;
    font-size: 0 !important
    }
.content-padding {
    padding-left: 0 !important;
    padding-right: 0 !important
    }
.content-padding.first {
    padding-top: 0 !important
    }
.content-padding.last {
    padding-bottom: 0 !important
    }
@media only screen and (max-width: 480px) {
    td.mobile-only {
        display: table-cell !important
        }
    div.mobile-only {
        display: block !important
        }
    table.mobile-only {
        display: table !important
        }
    .desktop-only {
        display: none !important
        }
    }
@media only screen and (max-width: 480px) {
    .table-mobile-only {
        display: table-cell !important;
        max-height: none !important
        }
    .table-mobile-only.block {
        display: block !important
        }
    .table-mobile-only.inline-block {
        display: inline-block !important
        }
    .table-desktop-only {
        max-height: 0 !important;
        display: none !important;
        mso-hide: all !important;
        overflow: hidden !important
        }
    }
p {
    margin-left: 0;
    margin-right: 0;
    margin-top: 0;
    margin-bottom: 0;
    padding-bottom: 1em
    }
@media only screen and (max-width: 480px) {
    .kl-text > div, .kl-table-subblock div, .kl-split-subblock > div {
        font-size: 14px !important;
        line-height: 1.3 !important
        }
    }
h1 {
    color: #222427;
    font-family: "Helvetica Neue", Arial;
    font-size: 40px;
    font-style: normal;
    font-weight: normal;
    line-height: 1.1;
    letter-spacing: 0;
    margin: 0;
    margin-bottom: 20px;
    text-align: left
    }
@media only screen and (max-width: 480px) {
    h1 {
        font-size: 40px !important;
        line-height: 1.1 !important
        }
    }
h2 {
    color: #222427;
    font-family: "Helvetica Neue", Arial;
    font-size: 32px;
    font-style: normal;
    font-weight: bold;
    line-height: 1.1;
    letter-spacing: 0;
    margin: 0;
    margin-bottom: 16px;
    text-align: left
    }
@media only screen and (max-width: 480px) {
    h2 {
        font-size: 32px !important;
        line-height: 1.1 !important
        }
    }
h3 {
    color: #222427;
    font-family: "Helvetica Neue", Arial;
    font-size: 24px;
    font-style: normal;
    font-weight: bold;
    line-height: 1.1;
    letter-spacing: 0;
    margin: 0;
    margin-bottom: 12px;
    text-align: left
    }
@media only screen and (max-width: 480px) {
    h3 {
        font-size: 24px !important;
        line-height: 1.1 !important
        }
    }
h4 {
    color: #222427;
    font-family: "Helvetica Neue", Arial;
    font-size: 18px;
    font-style: normal;
    font-weight: 400;
    line-height: 1.1;
    letter-spacing: 0;
    margin: 0;
    margin-bottom: 9px;
    text-align: left
    }
@media only screen and (max-width: 480px) {
    h4 {
        font-size: 18px !important;
        line-height: 1.1 !important
        }
    }
@media only screen and (max-width: 480px) {
    .root-container {
        width: 100% !important
        }
    .root-container-spacing {
        padding: 10px !important
        }
    .content-padding {
        padding-left: 0 !important;
        padding-right: 0 !important
        }
    .content-padding.first {
        padding-top: 0 !important
        }
    .content-padding.last {
        padding-bottom: 0 !important
        }
    .component-wrapper {
        padding-left: 0 !important;
        padding-right: 0 !important
        }
    }</style></head>
<body style=3D"word-spacing:normal;background-color:#f7f7f7;">
<div style=3D"display:none;font-size:1px;color:#ffffff;line-height:1px;max-=
height:0px;max-width:0px;opacity:0;overflow:hidden;">
      Access the Red Bull suite at a discounted rate!=E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD
    </div>
<div class=3D"root-container" id=3D"bodyTable" style=3D"background-color:#f=
7f7f7;">
<div class=3D"root-container-spacing">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" cl=
ass=3D"kl-section" role=3D"presentation" style=3D"width:100%;">
<tbody>
<tr>
<td>
<!--[if mso | IE]><table align=3D"center" border=3D"0" cellpadding=3D"0" ce=
llspacing=3D"0" class=3D"kl-section-outlook" style=3D"width:600px;" width=
=3D"600" ><tr><td style=3D"line-height:0px;font-size:0px;mso-line-height-ru=
le:exactly;"><![endif]-->
<div style=3D"margin:0px auto;max-width:600px;">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"width:100%;">
<tbody>
<tr>
<td style=3D"direction:ltr;font-size:0px;padding:0px;text-align:center;">
<!--[if mso | IE]><table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0"><table align=3D"center" border=3D"0" cellpadding=3D"0"=
 cellspacing=3D"0" class=3D"" style=3D"width:600px;" width=3D"600" bgcolor=
=3D"#ffffff" ><tr><td style=3D"line-height:0px;font-size:0px;mso-line-heigh=
t-rule:exactly;"><![endif]-->
<div style=3D"background:#ffffff;background-color:#ffffff;margin:0px auto;b=
order-radius:0px 0px 0px 0px;max-width:600px;">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"background:#ffffff;background-color:#ffffff;wi=
dth:100%;border-radius:0px 0px 0px 0px;">
<tbody>
<tr>
<td style=3D"direction:ltr;font-size:0px;padding:20px 0;padding-bottom:0px;=
padding-left:0px;padding-right:0px;padding-top:0px;text-align:center;">
<!--[if mso | IE]><table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0"><![endif]-->
<div class=3D"content-padding first">
<!--[if true]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=
=3D"600" style=3D"width:600px;direction:ltr"><tr><![endif]-->
<div class=3D"kl-row colstack" style=3D"display:table;table-layout:fixed;wi=
dth:100%;">
<!--[if true]><td style=3D"vertical-align:top;width:600px;"><![endif]-->
<div class=3D"kl-column empty-column-placeholder" style=3D"display:table-ce=
ll;vertical-align:top;width:100%;">
</div>
<!--[if true]></td><![endif]-->
</div>
<!--[if true]></tr></table><![endif]-->
</div>
<!--[if mso | IE]></table><![endif]-->
</td>
</tr>
</tbody>
</table>
</div>
<!--[if mso | IE]></td></tr></table></table><![endif]-->
</td>
</tr>
</tbody>
</table>
</div>
<!--[if mso | IE]></td></tr></table><![endif]-->
</td>
</tr>
</tbody>
</table>
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" cl=
ass=3D"kl-section" role=3D"presentation" style=3D"width:100%;">
<tbody>
<tr>
<td>
<!--[if mso | IE]><table align=3D"center" border=3D"0" cellpadding=3D"0" ce=
llspacing=3D"0" class=3D"kl-section-outlook" style=3D"width:600px;" width=
=3D"600" ><tr><td style=3D"line-height:0px;font-size:0px;mso-line-height-ru=
le:exactly;"><![endif]-->
<div style=3D"margin:0px auto;max-width:600px;">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"width:100%;">
<tbody>
<tr>
<td style=3D"direction:ltr;font-size:0px;padding:0px;text-align:center;">
<!--[if mso | IE]><table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0"><table align=3D"center" border=3D"0" cellpadding=3D"0"=
 cellspacing=3D"0" class=3D"" style=3D"width:600px;" width=3D"600" bgcolor=
=3D"#ffffff" ><tr><td style=3D"line-height:0px;font-size:0px;mso-line-heigh=
t-rule:exactly;"><![endif]-->
<div style=3D"background:#ffffff;background-color:#ffffff;margin:0px auto;b=
order-radius:0px 0px 0px 0px;max-width:600px;">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"background:#ffffff;background-color:#ffffff;wi=
dth:100%;border-radius:0px 0px 0px 0px;">
<tbody>
<tr>
<td style=3D"direction:ltr;font-size:0px;padding:20px 0;padding-bottom:0px;=
padding-left:0px;padding-right:0px;padding-top:0px;text-align:center;">
<!--[if mso | IE]><table role=3D"presentation" border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0"><![endif]-->
<div class=3D"content-padding last">
<!--[if true]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=
=3D"600" style=3D"width:600px;direction:ltr"><tr><![endif]-->
<div class=3D"kl-row colstack" style=3D"display:table;table-layout:fixed;wi=
dth:100%;">
<!--[if true]><td style=3D"vertical-align:top;width:600px;"><![endif]-->
<div class=3D"kl-column" style=3D"display:table-cell;vertical-align:top;wid=
th:100%;">
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:0px;padding-right:0p=
x;padding-bottom:0px;padding-left:0px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" class=3D"kl-image" style=3D"font-size:0px;word-break:b=
reak-word;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px;">
<tbody>
<tr>
<td class=3D"kl-img-base-auto-width" style=3D"border:0;padding:0px 0px 0px =
0px;width:600px;" valign=3D"top">
<img src=3D"https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/02f=
249a1-3df8-4bda-ac3e-07acbc209574.png" style=3D"display:block;outline:none;=
text-decoration:none;height:auto;font-size:13px;width:100%;" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:9px;padding-right:18=
px;padding-bottom:9px;padding-left:18px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"left" class=3D"kl-text" style=3D"font-size:0px;padding:0px;pad=
ding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px;word-bre=
ak:break-word;">
<div style=3D"font-family:'Helvetica Neue',Arial;font-size:14px;font-style:=
normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-align:left;c=
olor:#222427;"><p class=3D"m_-4819065091633940109ib"><span class=3D"m_-4819=
065091633940109ib1"><span>Existing news for F1 fans, we've just had a cance=
llation on a private table for 8 guests for the F1 Paddock Club at the Brit=
ish Grand Prix taking place at Silverstone between 4th-7th July 2024.</span=
></span></p>
<p class=3D"m_-4819065091633940109ib"><span class=3D"m_-4819065091633940109=
ib1"><span>Typically, 3 days passes for the Paddock Club (with pit lane pas=
ses included) are priced at =C2=A33k per person. However, we can offer thes=
e 8 places at a discounted rate of just <span style=3D"font-weight: bold;">=
=C2=A31,495</span>&nbsp;<span style=3D"font-weight: bold;">per person +VAT<=
/span>.&nbsp;</span></span></p>
<div>
<div dir=3D"ltr">
<div id=3D"m_-5005188245250255105m_-258539683895680222m_-125131915777133359=
7m_-1909154138366209422bodyTable"></div>
</div>
</div>
<p class=3D"m_-4819065091633940109ib" style=3D"text-align: center;"><span s=
tyle=3D"text-decoration: underline;"><span class=3D"m_-4819065091633940109i=
b1">Package Inclusions:</span></span></p>
<blockquote>
<div dir=3D"ltr">
<div id=3D"m_-5005188245250255105m_-258539683895680222m_-125131915777133359=
7m_-1909154138366209422bodyTable">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation">
<tbody>
<tr>
<td>
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation">
<tbody>
<tr>
<td>
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation">
<tbody>
<tr>
<td>
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td>
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"left">
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;">- <span>Entry to the Red Bull Racing hospitality suite in th=
e Formula 1 Paddock Club</span><sup>=E2=84=A2</sup><span>&nbsp;with excelle=
nt on-track views</span></span></div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;"><span>&nbsp;</span></span></div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;"><span>- All-day hospitality in the Red Bull Racing hospitali=
ty suite with gourmet cuisine and an open bar serving premium drinks.</span=
></span></div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;"><span>&nbsp;</span></span></div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;"><span>- Appearances by key team personnel, including race dr=
ivers Max Verstappen and Sergio P=C3=A9rez.</span></span></div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;"><span>&nbsp;</span></span></div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;"><span>- Guided tour of the Red Bull Racing garage where you =
can get behind-the-scenes access to the team's operational strategies throu=
ghout the weekend.</span></span></div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;"><span>&nbsp;</span></span></div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;"><span>- Daily walks in the pit lane, where you can get an up=
-close view as the mechanics prepare the cars for racing.</span></span></di=
v>
<div style=3D"text-align: center;">&nbsp;</div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;">- Prime viewing from above the pit lane and team garages, lo=
oking over the start/finish line, with free grandstand seating available as=
 well.</span></div>
<div style=3D"text-align: center;">&nbsp;</div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;">- All day open bar serving Champagne, fine wines, premium sp=
irits, beers, soft drinks, tea &amp; coffee.</span></div>
<div style=3D"text-align: center;">&nbsp;</div>
<div style=3D"text-align: center;"><span style=3D"font-style: italic; font-=
weight: bold;">- Gourmet luncheon starting with a plated starter, followed =
by a sumptuous buffet.</span></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</blockquote>
<p class=3D"m_-4819065091633940109ib" style=3D"padding-bottom:0">&nbsp;</p>=
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:0px;padding-right:0p=
x;padding-bottom:0px;padding-left:0px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" class=3D"kl-image" style=3D"font-size:0px;word-break:b=
reak-word;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px;">
<tbody>
<tr>
<td class=3D"kl-img-base-auto-width" style=3D"border:0;padding:0px 0px 0px =
0px;width:600px;" valign=3D"top">
<img src=3D"https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/bbc=
186af-cceb-46a1-87df-aac3cb179ff5.png" style=3D"display:block;outline:none;=
text-decoration:none;height:auto;font-size:13px;width:100%;" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:0px;padding-right:0p=
x;padding-bottom:0px;padding-left:0px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" class=3D"kl-image" style=3D"font-size:0px;word-break:b=
reak-word;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px;">
<tbody>
<tr>
<td class=3D"kl-img-base-auto-width" style=3D"border:0;padding:0px 0px 0px =
0px;width:600px;" valign=3D"top">
<img src=3D"https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/92b=
5c00e-e251-42c0-bf66-a2ca79f5495c.png" style=3D"display:block;outline:none;=
text-decoration:none;height:auto;font-size:13px;width:100%;" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:0px;padding-right:0p=
x;padding-bottom:0px;padding-left:0px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" class=3D"kl-image" style=3D"font-size:0px;word-break:b=
reak-word;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px;">
<tbody>
<tr>
<td class=3D"kl-img-base-auto-width" style=3D"border:0;padding:0px 0px 0px =
0px;width:600px;" valign=3D"top">
<img src=3D"https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/0aa=
1dde5-72b7-48c4-ac20-4f7ebe7da27a.png" style=3D"display:block;outline:none;=
text-decoration:none;height:auto;font-size:13px;width:100%;" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:0px;padding-right:0p=
x;padding-bottom:0px;padding-left:0px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" class=3D"kl-image" style=3D"font-size:0px;word-break:b=
reak-word;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px;">
<tbody>
<tr>
<td class=3D"kl-img-base-auto-width" style=3D"border:0;padding:0px 0px 0px =
0px;width:600px;" valign=3D"top">
<img src=3D"https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/6dd=
f9296-4fd7-4980-8cac-f3e280225e69.jpeg" style=3D"display:block;outline:none=
;text-decoration:none;height:auto;font-size:13px;width:100%;" width=3D"600"=
>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:0px;padding-right:0p=
x;padding-bottom:0px;padding-left:0px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" class=3D"kl-image" style=3D"font-size:0px;word-break:b=
reak-word;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px;">
<tbody>
<tr>
<td class=3D"kl-img-base-auto-width" style=3D"border:0;padding:0px 0px 0px =
0px;width:600px;" valign=3D"top">
<img src=3D"https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/f90=
bd904-3e69-4cbc-bb75-ebb8f1a9b73b.jpeg" style=3D"display:block;outline:none=
;text-decoration:none;height:auto;font-size:13px;width:100%;" width=3D"600"=
>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:0px;padding-right:0p=
x;padding-bottom:0px;padding-left:0px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" class=3D"kl-image" style=3D"font-size:0px;word-break:b=
reak-word;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px;">
<tbody>
<tr>
<td class=3D"kl-img-base-auto-width" style=3D"border:0;padding:0px 0px 0px =
0px;width:600px;" valign=3D"top">
<img src=3D"https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/f30=
5b926-0784-4803-a628-d1074b01dd50.jpeg" style=3D"display:block;outline:none=
;text-decoration:none;height:auto;font-size:13px;width:100%;" width=3D"600"=
>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:9px;padding-right:18=
px;padding-bottom:9px;padding-left:18px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"left" class=3D"kl-text" style=3D"font-size:0px;padding:0px;pad=
ding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px;word-bre=
ak:break-word;">
<div style=3D"font-family:'Helvetica Neue',Arial;font-size:14px;font-style:=
normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-align:left;c=
olor:#222427;"><p class=3D"m_-4819065091633940109ib"><span class=3D"m_-4819=
065091633940109ib1"><span>This is a huge opportunity to attend the F1 next =
year at Silverstone and these places will be sold on a first come, first se=
rve basis. </span></span></p>
<p class=3D"m_-4819065091633940109ib"><span class=3D"m_-4819065091633940109=
ib1"><span>If you do wish to make a reservation, reply to this email or giv=
e me a call on </span>0203 576 4529 <span>and I will be happy to assist you=
 further.</span></span></p>
<p class=3D"m_-4819065091633940109ib"><span class=3D"m_-4819065091633940109=
ib1"><span>Kind regards,</span></span><span>&nbsp;</span></p>
<p class=3D"m_-4819065091633940109ib"><span>&nbsp;</span></p>
<p class=3D"m_-4819065091633940109ib"><span class=3D"m_-4819065091633940109=
ib1"><span>Daniel De'Russo</span></span><span>&nbsp;</span></p>
<p class=3D"m_-4819065091633940109ib"><span class=3D"m_-4819065091633940109=
ib1"><span>Head of Global Corporate Sales</span></span><span>&nbsp;</span><=
/p>
<p class=3D"m_-4819065091633940109ib" style=3D"padding-bottom:0"><span clas=
s=3D"m_-4819065091633940109ib1"><strong><span>Priv=C3=A8 Global Events</spa=
n></strong></span></p></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:9px;padding-right:18=
px;padding-bottom:9px;padding-left:18px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"left" class=3D"kl-text" style=3D"font-size:0px;padding:0px;pad=
ding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px;word-bre=
ak:break-word;">
<div style=3D"font-family:'Helvetica Neue',Arial;font-size:14px;font-style:=
normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-align:left;c=
olor:#222427;"><div><span style=3D"font-weight: 400;"><strong>To reserve th=
is table, please do not hesitate to call me or reply to this email and I be=
 happy to assist you further.</strong></span></div></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:0px;padding-right:0p=
x;padding-bottom:0px;padding-left:0px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" class=3D"kl-image" style=3D"font-size:0px;word-break:b=
reak-word;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px;">
<tbody>
<tr>
<td class=3D"" style=3D"border:0;padding:0px 0px 0px 0px;width:200px;" vali=
gn=3D"top">
<img src=3D"https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/d09=
953c4-b4ad-431a-974e-c7880a406e97.png" style=3D"display:block;outline:none;=
text-decoration:none;height:auto;font-size:13px;width:100%;" width=3D"200">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper" sty=
le=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:top;width:=
100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:9px;padding-right:18=
px;padding-bottom:9px;padding-left:18px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"left" class=3D"kl-text" style=3D"font-size:0px;padding:0px;pad=
ding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px;word-bre=
ak:break-word;">
<div style=3D"font-family:'Helvetica Neue',Arial;font-size:14px;font-style:=
normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-align:left;c=
olor:#222427;"><p align=3D"center" class=3D"m_-4819065091633940109jb"><span=
 class=3D"m_-4819065091633940109jb1"><strong><span>Daniel&nbsp;De'Russo</sp=
an></strong></span><span>&nbsp;</span></p>
<p align=3D"center" class=3D"m_-4819065091633940109jb"><span class=3D"m_-48=
19065091633940109jb1"><span>Head of Global Corporate Sales</span></span><sp=
an>&nbsp;</span></p>
<p align=3D"center" class=3D"m_-4819065091633940109jb"><span class=3D"m_-48=
19065091633940109jb1"><strong><span>Priv=C3=A8 Global Events</span></strong=
></span><span>&nbsp;</span></p>
<p align=3D"center" class=3D"m_-4819065091633940109jb"><span class=3D"m_-48=
19065091633940109jb1"><span>&nbsp;</span></span><span>&nbsp;</span><span cl=
ass=3D"m_-4819065091633940109jb1"><span>t: </span></span><span>&nbsp;+44 </=
span><span style=3D"text-align: left;">203 576 4529</span></p>
<p align=3D"center" class=3D"m_-4819065091633940109jb"><span style=3D"font-=
size: 10px;"><span class=3D"m_-4819065091633940109jb1">The content of this =
email is confidential and intended for the recipient specified in message o=
nly. It is strictly forbidden to share any part of this message with any th=
ird party, without a written consent of the sender. If you received this me=
ssage by mistake, please reply to this message and follow with its deletion=
, so that we can ensure such a mistake does not occur in the future.&nbsp;<=
/span>&nbsp;</span></p>
<p align=3D"center" class=3D"m_-4819065091633940109jb" style=3D"padding-bot=
tom:0"><span style=3D"font-size: 10px;"><span class=3D"m_-48190650916339401=
09jb1">Registered Company Name - Prive Global Sports. Company no. - 1253747=
6&nbsp;</span>&nbsp;</span></p></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<!--[if true]></td><![endif]-->
</div>
<!--[if true]></tr></table><![endif]-->
<!--[if true]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=
=3D"600" style=3D"width:600px;direction:ltr"><tr><![endif]-->
<div class=3D"kl-row colstack" style=3D"display:table;table-layout:fixed;wi=
dth:100%;">
<!--[if true]><td style=3D"vertical-align:top;width:600px;"><![endif]-->
<div class=3D"kl-column" style=3D"display:table-cell;vertical-align:top;wid=
th:100%;">
<div class=3D"mj-column-per-100 mj-outlook-group-fix component-wrapper kl-t=
ext-table-layout" style=3D"font-size:0px;text-align:left;direction:ltr;vert=
ical-align:top;width:100%;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%;" width=3D"100%">
<tbody>
<tr>
<td class=3D"" style=3D"vertical-align:top;padding-top:0px;padding-right:0p=
x;padding-bottom:0px;padding-left:0px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" class=3D"kl-text" style=3D"font-size:0px;padding:0px;p=
adding-top:9px;padding-right:18px;padding-bottom:9px;padding-left:18px;word=
-break:break-word;">
<div style=3D"font-family:'Helvetica Neue',Arial;font-size:12px;font-style:=
normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-align:center=
;color:#727272;"><div>No longer want to receive these emails? <a class=3D"u=
nsubscribe-link" style=3D"color:#197bbd;font-weight:normal;text-decoration:=
underline;" href=3D"https://trk.klclick1.com/ls/click?upn=3D7ZpdBophAwrZEeo=
9o6yKdFTuapAr443SX9b-2FWtUFY0aQ4EDdKqo0cmaycS-2BCtCLV5lfwrFIQxHjYlWsE5ySLc9=
-2FdBUBtRJsr27VQQ-2Fz2a2d4AkfkL-2BMZH7UQqWV7ziARPaRzUpFRcLJwjvwpnNMW-2BUlP3=
QjSSasktOdLqRPhfeJfqNbPcKu943-2F7PdLH2cFpEFDj7neNeElcdUrrVd9z7V-2FGzOyQGP1J=
wZX8S6lKF-2BN8gVNKVWtrMkI6HGskhnMbVKTR_yxe3hxlEKZLb36qs-2BKApVr7ZX4aFxpSJbh=
jNkBlCEPRTGIvXkRptALDz9gXFwao88ZUyCDoej4CkYev8v0LAm5TojJRoEDhUFtWSRQKYSjtHz=
DAvCvmBvIlxxincGHAfjDnutWg7K5dU1YcS0PHiKMbd3Y-2FGFwaxkK-2B2IYgFSRdmHnpwsA3M=
IWK1zN4966rDtbi4Qi6snE1GBwQIxCZb9eDKtznsj4X2mxdrXzjLlhc-2BDdf1PNd3MYNtGTB-2=
B-2BUtrPsQUXUIcS8wfSelgmyEoEBT6sYkdSE5R2M7Ei2dfkqTNftA6wnzKbsuLgk0S-2Fc0NUs=
x6ogQD-2BdEUe1Rexj-2FlIN-2BKJeMELk9e544zkHPXFhTBFXHcQTlQqmX4FmGLnmMU2l7iwCv=
3rjnVa-2BkY80u65iPgNPhEVnz6O4Dqr0YGXfdqVqoKVuHeYonbUyUyByn4gSFR-2BfJ-2FN9ZW=
VbJQwOJ6Yw-3D-3D">Unsubscribe</a>.<br><br></div></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<!--[if true]></td><![endif]-->
</div>
<!--[if true]></tr></table><![endif]-->
</div>
<!--[if mso | IE]></table><![endif]-->
</td>
</tr>
</tbody>
</table>
</div>
<!--[if mso | IE]></td></tr></table></table><![endif]-->
</td>
</tr>
</tbody>
</table>
</div>
<!--[if mso | IE]></td></tr></table><![endif]-->
</td>
</tr>
</tbody>
</table>
</div>
</div>

<img src=3D"https://trk.klclick1.com/wf/open?upn=3DVU2koNEWgSKMLPFeqEdbNI9j=
Cap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfZOdCiZZeabIGzW73Ztb9K459lgoJkMZ=
LysyMhWGIoYNFpH75-2F8FXl69y5xhrVvnvuPaESOJLt8TXy0mcvho0KD4RNu1-2FzIO-2FHdAJ=
dMti0tNSpIfRtfy8xns8s7G095vDUKlgh6u8Njk0CGCA3XQt6QCjADrRIURWJqjJUbuB6RBlbd9=
ib8m5cVnHEEr6inhBcPpg4TEcR6vs38yYHmOUzZ3ZNmbqaee7yy1OFxxLUHWJwXsmrz5PfEN6cl=
0OUbUTPN8prIACiv0VGtLHoFIpjH8Oy9ikINP9Uwslqyzi7sj2296yQSxEld-2FqVh1MOcM2rem=
t7guRvUjci9-2BPlNAkyYGXjsTP2znbs9kPnwWK061A4u8Tdkty4XonkXKMdkCIabFJKWwVD5mo=
91sla5hE4NZq2kBhUFWS30EzUiIpNJw-3D" alt=3D"" width=3D"1" height=3D"1" borde=
r=3D"0" style=3D"height:1px !important;width:1px !important;border-width:0 =
!important;margin-top:0 !important;margin-bottom:0 !important;margin-right:=
0 !important;margin-left:0 !important;padding-top:0 !important;padding-bott=
om:0 !important;padding-right:0 !important;padding-left:0 !important;"/></b=
ody></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ZdgYI3dIQ0q6uSyyGMl3YA%40geopod-ismtpd-0?utm_mediu=
m=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-=
dev/ZdgYI3dIQ0q6uSyyGMl3YA%40geopod-ismtpd-0</a>.<br />

--34a15a1bca1a7af13a5ab40e35cf6db0d77074f3c561dcf02c63c866710d--
