Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD7C2P6QKGQEODLN34Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CCC2B7AD6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Nov 2020 11:01:51 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id q17sf658493wmc.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Nov 2020 02:01:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605693711; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wl8K1xOXaXfKXKjLOSSxnWIoVmTMG+gbrWF+MJCZZBHZUxBHuNGwzmHb1AceQMOt2g
         qj+1I/6pmbfou0PNlEVjjQszUbxDETXGt5xmQgFu5FmkKYigIY4JWVVSXc9i0mi0Ja6p
         MpZxFgCN3zR0K9ysFPONy1r9nUV2+x0sZDyUIkHRbbBYkc8qmYyBQlayvAMJnftH/GPV
         YtEtmv/i53cpI26ZDNY16V2vdajh63P4MnO5HmOH0rHHQrAXFVTlxifb4NH8LTxS7p6l
         5W9KUiLabq6OrZpwXMAp4nU+fzF5De0I5ygOQQUkCyTfw8yjW2ISlALbwsU8B/uO+WNp
         B7Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=pk9rRx/+jlnIzaQF2S3pvgPyliFMGZH/KdIWtKlMW80=;
        b=PtWMOWGKuisGZL1DMTYkBLTlx9bH5gvrHSOYza/qNfcemLTkzl8Ynb1ZFVBfhzYd9n
         aBAR9n0OKa0pf2xjm8iS0X/gH51qHg7eNQXwev6J6AADBJmGesULuGylShWcG2AWW9FU
         uqa+vPHSGvjOVb+0JtuTNX0bEwfYOxkSTT4mN8h4IUsha6jD67ycbxL87mXNm9E2IEVl
         L+3+G/cTjJqHvqtUBk0tbe4LZinmYxCaIDq7oW7bgQwtPLkCeq+fGlMTUnR89xJptk0Q
         3O9rwjr61cEd+CN7T+qygC5K/WL509HNZCnloI3T+88x2YXAsVVpqEFESdl5DPYQtzJE
         9hKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pk9rRx/+jlnIzaQF2S3pvgPyliFMGZH/KdIWtKlMW80=;
        b=c5yT/WGKn9gzzUrS8yAKzxicw5a90yJyH/EO/AFsUfpzMmCKnjQrnLQC/u3qqGbWLk
         FEwu+BZfZobZh5xUTmAiv3e3cnQ52YxkCn0nh8dDvssTLheX22DdaRKzoXYER2DJK8zA
         rNmtL/u1jIqdKc+gIGc6erwazdzWDrPj+ddlnschWDs8I34magNurAPeOWv0X+eyWP9B
         3GoWNZO2fSGtRJpfezMW+/BL3DtwxDDBuTCUsVTI9BxHN561qJ2Ls5kNwkVMFggen3ti
         nQbzMVdH7Mg4OlZO5rVs1yvMZJ1B2nb7zjuV3jiUbWvwnymfopKFXV6hBFZJpLsPfKTu
         J6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pk9rRx/+jlnIzaQF2S3pvgPyliFMGZH/KdIWtKlMW80=;
        b=P6e8M8AaMmUfLcx4dO78sgStI6KYGeqNMUzH3Kh0fzqiGXN0tvaVZZnhzUZP8KCUb8
         abUhQl11hxBhk1obCd7qwspn3kDLxLA3lpHWtyy7gzW2A8tTYLf/Dp2MadgODk4VjKuM
         U3KkXROl5Ct5yhmVyRYk5mQUIWSCjz0q+iWMxV0zZdsdAWOk1jPwhHamrWQRIBx2g+7Q
         3NpKV7eE4/rtIcu4PJgjydjgSIVPpnpUNQNdkidA7sG0y+drhOOzqHD9v5pZeMyRGdMB
         Lenvrzg8OIpqaOlcD1KvbIDdveHgmQKC0KGzLIZs5clrAneO+PltptMBSm/V9gajGWvK
         zJvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531pgRga6HU3dI+lm4rvkY8vwYNmW6qxVbeW+mB3xMW1QNaCpZC3
	Mr3ntikCPAjDBrLuK7xPcag=
X-Google-Smtp-Source: ABdhPJzBe2MapKZdkwqF1HZt7fw8oQatXrdAE/9EDDr5+mfdPSYrOuUBS7BZ4SVeIy/Lbj9qPLIUrA==
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr4178487wrv.255.1605693711317;
        Wed, 18 Nov 2020 02:01:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:408a:: with SMTP id n132ls2809100wma.2.gmail; Wed, 18
 Nov 2020 02:01:50 -0800 (PST)
X-Received: by 2002:a1c:3d6:: with SMTP id 205mr3681945wmd.85.1605693710175;
        Wed, 18 Nov 2020 02:01:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605693710; cv=none;
        d=google.com; s=arc-20160816;
        b=WOOrwqCGZ7N8xsXMXaOfDMzyrpQUo8ZDk8yiRNwGJ4gR+8vakBRFr1spFrus6Vx/FM
         2P4a/QnwxR0d7gPSGD99vw1A189EVbtycW4HvJWRogML18Kv8qGRy/qJANIyvsNkRELI
         74koHLGHCMJhQQI5aHPhKXjXGmCuJIl9tDGpbgpdgCgMOJYhOgL6ybumvW9wOPfN8Nxx
         itV65OOUU3rcYxFUkLKd6sFncAF346Vgp+vI6e0zGWAt43oZCHSqpg+YLf712ivy9qCo
         9txQ0w0FHCITgqJqaXnBvhaac7/I1cyCdiyEqtrBZ3CdHqs3tomO9eXnuadt+x53LdYF
         mPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=RbuoC6/OcRafJZRO+ss29OeFStm3Bmhxl/D8H/BVx0U=;
        b=rqmnAB9S5dagfrcyHkA4RQg4S/X8XxGRVpv3YqGKjoJIpXXFqYTFhV9N21BCc5XRJG
         AabCLiVa0ICUhZuLUldx2pVLmTHLwfAQFvIr49QNbjpqBRXVxJ564T2+kyBBPhXrc+LI
         VivQKLu4UTAblGdBrPODtd+skOMrHrAMLTBH4IPLvhYQghLb5OM+lWxRmL42NltMFu1W
         oVoYD782Khki59neSa0QVL0NlrlSVuoqtiNPe3evqIyizsnmgk/CrcuShww12g/k9649
         TU7EibgyxLshBKJrRXOX6KMVY89Jn/Fh0Y1MXR4KGluiOnvL3V9mNBx5/oxp92igjSUQ
         7zsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id i1si60068wml.2.2020.11.18.02.01.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 02:01:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AIA1mLM002671
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2020 11:01:48 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AIA1mjF023631;
	Wed, 18 Nov 2020 11:01:48 +0100
Subject: Re: one question about MSI-X support for vPCI
To: Peter pan <peter.panjf@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <e223356c-fc2c-4c3b-98c3-6d27fba1099an@googlegroups.com>
 <7552cacf-519e-9cde-ba5a-c2e2121c5a54@siemens.com>
 <650b2d0f-b721-44a4-9572-28c2a88a7559n@googlegroups.com>
 <aa38bda6-400a-4342-8b72-e033c56fd89dn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9ea3bc46-677d-7e23-0bff-70d0218898da@siemens.com>
Date: Wed, 18 Nov 2020 11:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <aa38bda6-400a-4342-8b72-e033c56fd89dn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 18.11.20 10:50, Peter pan wrote:
> Hi, Jan,
>=20
> I have one new issue and not sure it is a know issue.
>=20
> The issue is: when I ifconfig up ivshmem-net NIC in root cell firstly
> and then ifconfig up ivshmem NIC in inmate cell (runing Linux),=C2=A0 I c=
an
> ping through between two NICs, but if I ifconfig up NIC in inmate cell
> before ifconfig up the NIC in root cell, I can't ping through between
> two NICs, and I found NIC in inmate can only receive packet sending from
> root cell NIC, but NIC in root cell can't receive any packet and there
> is also no irq received for ivshmem NIC.
>=20

The link states of both virtual NICs are up (ethtool)? Is there any
ivshmem-net interrupt received at all on the root side? There should be
a few during setup at least.

Check that the interrupt line on the root side is really free, and also
that GICD is properly intercepted by Jailhouse (check mappings).

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9ea3bc46-677d-7e23-0bff-70d0218898da%40siemens.com.
