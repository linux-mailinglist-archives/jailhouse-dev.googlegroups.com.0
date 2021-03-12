Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBC43V6BAMGQENJPV3LA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E1E339824
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Mar 2021 21:22:35 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id h21sf11546605wrc.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Mar 2021 12:22:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615580555; cv=pass;
        d=google.com; s=arc-20160816;
        b=JOKRzVVwk2VoBJkkqGI09qs5xfTrLX2K9azDDYs8Jdy4q1ZXHhCRUKSHQr2iCnG/5H
         zjOE7POrEzeAAUIRsBR1FWJKhEfNbVX6qTHtBlidjunY+Q9zki0+B31pHT5m6n3v5bLp
         KKuV7g2godUY2TOg9Zyog87PgojYATrvkC0cvuAz/V5OQpvY3NUOSeO7CmAF+BwNEOAj
         bv40OLpTC/QSnnv52rZhsrOSiERYfT68nHoVZSqZK2hfg/0ceRIwRMmHnd6/y3tHV9B8
         oTIEjNm5/WBVfo5jBxe0KCe35kmlDvz+7A+JX6OHsrlcCXaZVkxBpZrfk2F7NqV7KVZL
         p1EQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=oiSLi4++mJJAGJBed9+Q2JbBLXt5sMgcGXbVAIYFDD8=;
        b=HUbv93AbyAtgNpTH8xg3eL15Uqs9oUTP2/XHkPnS909/5HhkUDiF8fBozfd0gBIY4t
         3Zmdgvv0YSO72KBO8xRyi1ag1g9QZzGV9BRBWkR+A6H9jhHkkChlNNZ0OQfGRik2VUY3
         fWelk2eAh5L+cOBAdlajP43UrJdbwVuOP9dvH4JgsHPohmVzI51oOuoWQk3iN7iVGLc9
         CwXbGng67k1iZZ4Gf+Ey+m607RMa6UBIkZqTlN3Q0Rc2cweZFcz5ZAOSjKK7KzvSOgks
         0RkgrX6xIxETFWCdcg6wDuaIPvdm18hzVODDHtoPhb16AtFgrmUJ3k/DwBMprm8ReF1/
         GSVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oiSLi4++mJJAGJBed9+Q2JbBLXt5sMgcGXbVAIYFDD8=;
        b=dxXg1BQbOE8nc78wM/tnkdfwqZcp9o6ZedZh0iZ/hzFXg6eYCF8RkyR/O03c402Ea4
         hmn13yq7lpSiwxp/1sDqFW6yJNIULOmYiBfXr3/bh4l2sOCz8TxSJtqpMmhggqeJYK4x
         AbFpgSpTlyQIlcrWiJN9j2mssOjlfahkykQkfA15LL2OaYDAfZ70l9wWufdZKswWj9G8
         l+2h21HS9zRoTMG+PXWNwNKLlQpfxdF9vnfab7RvY/BW3kzRRf0KS3exrN/6jXZLBLAt
         GfXRZBfxdJUeCwLw5dXJVsnKuFKOQB/DQBy/QYs1/LEKmFenKZNPfwf6Pl67/IOs++0i
         5xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oiSLi4++mJJAGJBed9+Q2JbBLXt5sMgcGXbVAIYFDD8=;
        b=EA8aPeCjdnCwv7cZIvklnZEdLXPHdPuLPHYtwjBT+E9VmrxKQzhbT9Nc8XRwBcrHlM
         10glP9ykAmEEbVcEh/PADHu0iSwRwqGOvZ8yB3+Usfjii7/nwmSVwA/IwhIIZrhl1qrb
         ddhjPFrry9z0lwrh4FFPLom+nuUjF3A1Rni+iavCfR45AGNl3j/2w3gI64sx5SEBaBPG
         jbZH4J931iryFVNVAaniPQBQC4U3+H8MMC2nI93n0vk9wXaTcTFhJlSr3zs6k2th/MUQ
         saUecd1KU77nSUBZ3YUsZE1Gnr+gqNT6YmKqW/uPUxDXyL4lLM59zYWkrhKpRf+fbL/M
         JaZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532IyPzqdfX3P5bORA8MdkNdqEyKQISQ0doZd5/kcq10kAjt5s5a
	DJgiUJALhi/s3poAES5FnB0=
X-Google-Smtp-Source: ABdhPJx3qtyPUa/PKSKBuapYJz6JYZqGwdacqtSem33gCAjmVZYi1hcmEupDbuapoM3fcgyCmJMTjQ==
X-Received: by 2002:a1c:4382:: with SMTP id q124mr14918965wma.16.1615580555404;
        Fri, 12 Mar 2021 12:22:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d1e6:: with SMTP id g6ls1084785wrd.3.gmail; Fri, 12 Mar
 2021 12:22:34 -0800 (PST)
X-Received: by 2002:adf:c64a:: with SMTP id u10mr15692702wrg.412.1615580554566;
        Fri, 12 Mar 2021 12:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615580554; cv=none;
        d=google.com; s=arc-20160816;
        b=093s2kmD4T0bb7JG35IJsqovS52DyBc47A34SlyQZtouqGHVeCR75nr281ypTIC4m2
         +WTXTvcVYry4h+GACNrVUW01IjOs4TTmETqmy61k+3cKDM4i1RnFcUDrwztb9uFdhf9b
         Q93bZkc54929dn/EhwrjHOXKTkTYv2017GtIstZd7aZkjsuR/HHa4yylkusCtxs+SngN
         8hbB7B+qxosMkozQwotHBK9g+45sGO3KXB6Slu5DHFlhVvdi04BCpNo20r6Z8IPSdOfK
         uRxN/2Tzn0Ukho5ePRVBmL/8X1sdN95qBZYi5vH4nKT8oH7KNPLtDj08PZWoRlNGv6TU
         ZveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=R6eewhOkzpuDVeV7DCIC74s0+7qD73xjI+tj2qKckJM=;
        b=YIeFjNFMcgVlV+h3/D5UGNuuL7vL0XbmTC27xHC2eYz13/F1fmHQnr5ViRpl3dyC2q
         LQ54jYO5EAbchdYEyICb1fFqLzMTjYrP4JnRfIQD5kelooZS1NfMOCc0wiv0ljtYujoh
         4ao4i5Pa+jvG8fVio0QK598KLlF+bLfFYTNlo5UgvOV760TgfMFhkvXlMtJBYly50sxX
         J9U0TM7kuMFhliPu5qjSYR3F2fBnyobarPtfTJUDlF9furedBlh3/ym2WNJIseeUYKaC
         2t+ObJuv45cKOQw96+qcNYfyzyid+sSExeq1dXZumVRdA2I53yKFtmY+kt/DdLDHJY9a
         0iSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p189si258290wmp.1.2021.03.12.12.22.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Mar 2021 12:22:34 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12CKMYkl004370
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Mar 2021 21:22:34 +0100
Received: from md1za8fc.ad001.siemens.net ([139.22.115.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12CKMX2u024987;
	Fri, 12 Mar 2021 21:22:33 +0100
Date: Fri, 12 Mar 2021 21:22:32 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
        "jailhouse-dev@googlegroups.com"
 <jailhouse-dev@googlegroups.com>
Subject: Re: Invalid PCI config write, port cfc, size 1, address port:
 8000f940
Message-ID: <20210312212232.19511dbd@md1za8fc.ad001.siemens.net>
In-Reply-To: <4f378475d9cb4393a902160f0da81f7f@spc015.packaging.ulma.es>
References: <4b6f864a20164d4884425ea87059a92f@spc015.packaging.ulma.es>
	<0d6ec3fd-adf2-d54e-57c9-99244f280538@siemens.com>
	<4f378475d9cb4393a902160f0da81f7f@spc015.packaging.ulma.es>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Tue, 23 Feb 2021 14:26:32 +0000
schrieb Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>:

> Yes, I was trying it and it seems that it works.

Tight ... chicken ;)

Henning

> Thankyou,
>=20
> Rai.
>=20
> De: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
> En nombre de Jan Kiszka Enviado el: martes, 23 de febrero de 2021
> 14:21 Para: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>;
> jailhouse-dev@googlegroups.com Asunto: Re: Invalid PCI config write,
> port cfc, size 1, address port: 8000f940
>=20
> On 22.02.21 09:27, Raimundo Sagarzazu wrote:
> Hi all,
>=20
> I'm trying to give SMbus access to an inmate cell but the system
> hangs on this error: =E2=80=9CInvalid PCI config write, port cfc, size 1,
> address port: 8000f940=E2=80=9D when I try to load the cell.
>=20
> It=E2=80=99s a x86 host and we already have jailhouse running with two in=
mate
> cells giving access to net devices, sharing memory, etc.
>=20
> From "lspci", I have:
>=20
>               00:1f.1 SMBus: Intel Corporation Celeron N3350/Pentium
> N4200/Atom E3900 Series SMBus Controller (rev 0b) DeviceName: Onboard
> - Other Subsystem: Intel Corporation Device 7270
>                             Flags: medium devsel, IRQ 20
>                             Memory at 91616000 (64-bit,
> non-prefetchable) [size=3D256] I/O ports at f040 [size=3D32]
>                             Kernel driver in use: i801_smbus
>=20
> From "jailhouse config create ...":
>=20
>               /* MemRegion: 91516000-915160ff : 0000:00:1f.1 */
>               {
>                             .phys_start =3D 0x91516000,
>                             .virt_start =3D 0x91516000,
>                             .size =3D 0x1000,
>                             .flags =3D JAILHOUSE_MEM_READ |
> JAILHOUSE_MEM_WRITE, },
> ...
>               /* Port I/O: f040-f05f : 0000:00:1f.1 */
>               PIO_RANGE(0xf040, 0x20),
> ...
>               /* PCIDevice: 00:1f.1 */
>               {
>                             .type =3D JAILHOUSE_PCI_TYPE_DEVICE,
>                             .iommu =3D 1,
>                             .domain =3D 0x0,
>                             .bdf =3D 0xf9,
>                             .bar_mask =3D {
>                                           0xffffff00, 0xffffffff,
> 0x00000000, 0x00000000, 0xffffffe0, 0x00000000,
>                             },
>                             .caps_start =3D 0,
>                             .num_caps =3D 0,
>                             .num_msi_vectors =3D 0,
>                             .msi_64bits =3D 0,
>                             .msi_maskable =3D 0,
>                             .num_msix_vectors =3D 0,
>                             .msix_region_size =3D 0x0,
>                             .msix_address =3D 0x0,
>               },
>=20
> First thing I can see is that lspci shows that device's memory region
> is: Memory at 91616000 (64-bit, non-prefetchable) [size=3D256]
>=20
> While "jailhouse config create ..." shows:
>               MemRegion: 91516000-915160ff : 0000:00:1f.1
>=20
> Is that correct?
>=20
> Anyway, digging in the code I can see that the error comes on
> "hypervisor/pci.c, pci_cfg_write_moderate() ...", when trying to
> access address 0x40 but device has no capabilities.
>=20
> Giving access to this device is not a big issue for us because we can
> share "/dev/i2c-0" status over IVshmem but I'd like to known if
> there's something else I can do or it just can't be done.
>=20
>=20
> This config space register might be a side-band register. You could
> permit access by modelling it like a capability, ie. create one at
> 0x04 of the needed size (at least 1 byte) and with write permissions.
> Cap ID can be 0 or anything else invalid.
>=20
> Jan
>=20
>=20
> --
>=20
> Siemens AG, T RDA IOT
>=20
> Corporate Competence Center Embedded Linux
> --
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group. To unsubscribe from this group and stop
> receiving emails from it, send an email to
> jailhouse-dev+unsubscribe@googlegroups.com<mailto:jailhouse-dev+unsubscri=
be@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/0d6ec3fd-adf2-d54e-57c9-9=
9244f280538%40siemens.com<https://groups.google.com/d/msgid/jailhouse-dev/0=
d6ec3fd-adf2-d54e-57c9-99244f280538%40siemens.com?utm_medium=3Demail&utm_so=
urce=3Dfooter>.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210312212232.19511dbd%40md1za8fc.ad001.siemens.net.
