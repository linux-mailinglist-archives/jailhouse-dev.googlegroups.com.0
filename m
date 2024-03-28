Return-Path: <jailhouse-dev+bncBCAYF6GBVYFBBRXYSSYAMGQEAQCJ5DQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C12288FBEF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Mar 2024 10:45:44 +0100 (CET)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-ddad4fab252sf49274276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Mar 2024 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711619143; x=1712223943; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg6mrz6yVm7R0GXWbxrWx3tiQAwBfCgsaRH0twyByFU=;
        b=DTFWxtFSxrT5QKuh1kzXFilQgxJBIEki4+XtFQLXxD0wAxjbPtHN0ZJvKUDIz10nx9
         Ef3RnagKm1DwkLakiAyRRCRzP9eAjaoa887yWa8dhGWDVEakEBDqrYfDngxAWSvcCd+T
         T+qf16PQgHo0F/Pf1fkk8977X39oqSomJ35Jau2t2/OxzuHHfm5irtRhiAZmE1NyuTIX
         xgs1MWg0DxM1bZeGRCYxJZBXJ1cH1lmoQDTfeniQboaazF+iprgdy0ZEnNA97HESShzE
         /NuMQEt1dmyEHsYu4o10T2nqiYrfni07LIgNF8XIMLgprVsTyvEjKMhDbF4yXysHIuws
         OH/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711619143; x=1712223943; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg6mrz6yVm7R0GXWbxrWx3tiQAwBfCgsaRH0twyByFU=;
        b=D7VEY5ICZipMbDA1v3k6wsoN2QMicX4VfdsLcq+L9xSkqyAYV1BY7nVnoMFUDnyZvc
         rMbW1VsxVLUzpSHHNOjaT9qBnmDVHIK+/xbaEHFVj9rP/BhZo1I9vgLuWy2W/fsEuq4S
         1smGBUVyMxzsBjx0LReasEBzdkSVIzyTEZB7jwr6sR6Nh5/Iq8H8eaoiuhHqTN7j/Cu0
         ZuUGuQAReAfmLdpGQJ7Wx1LE8K9ck+rlV1F7Q/zHLRO+fPkkVHFlGc3gp819eAmQsfFM
         6Ds+OsSD+E1Uz/IcnWbP6EszWxlsHuqy7bDdq1xasDUD/TUJfgurd1qKCSg22Me+mz0l
         oNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711619143; x=1712223943;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg6mrz6yVm7R0GXWbxrWx3tiQAwBfCgsaRH0twyByFU=;
        b=D7OG/K66l86vLMXy8RsWyxGCFFo/drzkt2GgO2r4Qy5nGJdTugkm6Nh9t3DVHvJGFC
         LcTKzRKpNkPYem8HEwh8d4GxvNVUF+5BJ6fGOrCMJIzaaGH1/+AiMBfRCm3LhtIh9IW4
         oKQAeHM4wwOapKkIkzy8G2xIlUHMEHNUJx1c5rv/b2nAL6rPUc+1JFT1J32dn96OQUxQ
         QFTzX2pW/MKQ5KVEkTUJUzxE0YJoV7/SoQnZujL8LgAvkRRzd0sSKvHefDimIiphGeA2
         S0QM8Yh4aEIXSJkRmyPXr28z4baUV5WEJODuGHds4PmlDQEgAZojGmAc7zlL5hkrl1GM
         6BUA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUpfjVR0s+m4/Fgm9IjV/gX0QFDW3xltIj0jDbFCqmVqiDLubBISd7uOrLikhLc8DFMtgpb61puuJEdy4FxDazGGn7FwBmfYusch8Y=
X-Gm-Message-State: AOJu0YwLkpZBQNQTe3YTqaNezJpKi5GaclLN1d2+rmjXq9spEGVFpRAT
	UtlXu3P4jIpuIbICjyRo+U8GUsRCBi3mkFya0qfJo7ZI54OQ2VIM
X-Google-Smtp-Source: AGHT+IEekHPjr2rgOEIm8Ni2XR0pEQohSBJZrIBsJWprTzxnXi0eFlgztuJuGshtVhzuLf/cYo8X8g==
X-Received: by 2002:a25:9f07:0:b0:dcb:cdbd:6594 with SMTP id n7-20020a259f07000000b00dcbcdbd6594mr1601200ybq.3.1711619142752;
        Thu, 28 Mar 2024 02:45:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:c3:0:b0:dcd:a08f:c83f with SMTP id 186-20020a2500c3000000b00dcda08fc83fls114656yba.1.-pod-prod-08-us;
 Thu, 28 Mar 2024 02:45:41 -0700 (PDT)
X-Received: by 2002:a05:6902:248f:b0:dcd:b431:7f5b with SMTP id ds15-20020a056902248f00b00dcdb4317f5bmr750029ybb.0.1711619140974;
        Thu, 28 Mar 2024 02:45:40 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:45:40 -0700 (PDT)
From: Yulon Liao <lylguagn@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <eaddfc4b-a44e-433e-9c7d-cb9bbbe4351en@googlegroups.com>
Subject: IRQ way for virtual pci
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_89582_1408369841.1711619140487"
X-Original-Sender: lylguagn@gmail.com
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

------=_Part_89582_1408369841.1711619140487
Content-Type: multipart/alternative; 
	boundary="----=_Part_89583_1390344456.1711619140487"

------=_Part_89583_1390344456.1711619140487
Content-Type: text/plain; charset="UTF-8"

Hi,
In qemu-arm 
While running the ivshmem-demo example in 64, I found that inmate-cell 
program reading the [.pci_mmconfig_base = 0x08e00000] address will cause an 
interrupt. The hypervisor finally calls arch_handle_dabt for processing. I 
don't understand the reason for this interrupt. How is it configured?

Kind regrards,
Yulong

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eaddfc4b-a44e-433e-9c7d-cb9bbbe4351en%40googlegroups.com.

------=_Part_89583_1390344456.1711619140487
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><span lang=3D"en"><span><span>Hi,<br /></span></span></span></div><div=
><span lang=3D"en"><span><span>In qemu-arm</span></span><span><span>
</span></span><span><span><br /></span></span></span></div><div><span lang=
=3D"en"><span><span>While running the ivshmem-demo example in 64, I found t=
hat inmate-cell program reading the <span style=3D"background-color: rgb(12=
8, 128, 128);">[.pci_mmconfig_base =3D 0x08e00000</span>] address will caus=
e an interrupt. The hypervisor finally calls <span style=3D"background-colo=
r: rgb(128, 128, 128);">arch_handle_dabt </span>for processing. I don't und=
erstand the reason for this interrupt. How is it configured?</span></span><=
/span></div><div><span lang=3D"en"><span><span><br /></span></span></span><=
/div><div><span lang=3D"en"><span><span>Kind regrards,</span></span></span>=
</div><div><span lang=3D"en"><span><span>Yulong<br /><span style=3D"backgro=
und-color: rgb(128, 128, 128);"></span></span></span></span></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/eaddfc4b-a44e-433e-9c7d-cb9bbbe4351en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/eaddfc4b-a44e-433e-9c7d-cb9bbbe4351en%40googlegroups.co=
m</a>.<br />

------=_Part_89583_1390344456.1711619140487--

------=_Part_89582_1408369841.1711619140487--
