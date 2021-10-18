Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB75ZWWFQMGQEMF2S2LI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD6431798
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 13:39:43 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id m16-20020a056512115000b003fdb79f743fsf7479819lfg.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 04:39:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634557183; cv=pass;
        d=google.com; s=arc-20160816;
        b=kvNCFqaIxmvjwHHFoIPAOr5CR1pAKVYj15cPZWiaNt69wecTd0J6ocshjjXBn+YcA6
         7GDXOZ7IIWflZxZsfHuiCyPO4zrzDw7IRlVdqqKv5qBPHQcFlBs/aOtwzR6z01f3beuZ
         Kf2QFmZsn6Qy9yJllAjFjrGN/xbrWC70wPrFpCuG6DPblNXBlyEP6HTRNJhaKCE7q32Z
         jgd4ijiPkVmX0aDyt5jz3OrI97EMWWts/mX+vG0ndyyzrKPH9WK9I0xbegkrMNitE2a6
         5TnZXeWsXL2LGHUPpkDo05Q451tNceCzBfHdYn4HrC6vysexn+KX8kkP4su/2hBY4ndr
         7zLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=XJUCBJE6Vqwl7YrNIKWfhQRBEUu+wL3UTc79E4iwvjA=;
        b=D82c8jR14I9NKglavmHS0XT5rdhWorVkw5/mmdLw0/S1WIT2P+GPeR0xXNUg2BiFop
         Gt3Pbcj7xmQFhCwtjPpFRV3O1QZtxGVHkSq5ZR1ialHfzBcgh+hT0B8kv/8pkAFAcrxH
         jEK/E+X5y38vcu4R5dsEDFwBsiLC45WwVf5M16kAIIcC3WOqOn8aajCZ54iAKgo0OJRL
         qHesKv2cEgQ4DfSPfjSmutY/oBvV6P1JrjO9fwCHam+LC1MM25/79o9zGRtRGsa1B4uO
         BCEx2XnU2AgEbYhQ3c6r0wYYv5zganN0iQYhsDBqjgIvZqakFNfX3q+WL+kmEiS8CisO
         qtnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XJUCBJE6Vqwl7YrNIKWfhQRBEUu+wL3UTc79E4iwvjA=;
        b=ZnsPZVmJaK+alC9O34YQgQWWLNNoQ52IugJc2TCF2dS5BydxXaeIUKT8mBMhpEw2rQ
         7+4eS+iru5/PGxrl0xETBC7kgjws6SLEY8TRn4gJc7pEvMCuiHKOBDtQxy0nSfDILy3A
         9Y6PtIqKV/IzE8pPwdFV1LsPyhUPQQLKdwsxFrimGgEeId2zsHRXpVPDxsuwnKZ6uj37
         S4Ez/YXngMFUpPb1rBwXR0OqojiaKfKa9pT/WympAm2nZYy+SgjWlJkrzO8VK+goHUfA
         3TDUtFGrOCGXQhujca0q9mUkR4ljBG2npvyt5/spvjs0sTf38qIQazgSQOL+us7wZ7uw
         zvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XJUCBJE6Vqwl7YrNIKWfhQRBEUu+wL3UTc79E4iwvjA=;
        b=5m14IbCnIp8zXa5X705Hgd2+Jz88iONJXB6KHLF/APkk4El1ZySDP1e2wN81JR/Azh
         KE+Lk47q1e3J6KfD8Yr1MrV12irgaYiQOfPR1U6ESidZSjkg4vvkeX3KXoNxOEJ0XsKK
         nnrbPZ9OxwRSOOvVJPVkqZ4CaLcjq9i0pivTwQnYDUx2FS6KxK4e8gnGm4E75Mfy3t+o
         aAWT6w45IqAjxcaTLXTZR5HMg9t73jxJfijPc0JHxRDPDzHWLHx0zCtz3X9dZC13qo7h
         LH6V2MXAi/Vz6EaLFmwwCJhjKfXWDukQC/EgzHjDI3i3fh06E9qwKaDmHEHqmUU3oYkd
         iKLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OE8KKiOK3m58qRPTYws6ncwuhOuUdQqh/oWrJ1SwydEiuv6US
	QpMCkmM/v4GVIcuJtGrHk1g=
X-Google-Smtp-Source: ABdhPJwXz0BSndlZ8sIp7R0XP2hsIK3rzWdn/TKTIL1sjFb4SRsZYIdujE40VOvRb3rXD/OMhpad6g==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr27542062lfq.553.1634557183246;
        Mon, 18 Oct 2021 04:39:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f14:: with SMTP id y20ls451970lfa.1.gmail; Mon, 18
 Oct 2021 04:39:42 -0700 (PDT)
X-Received: by 2002:a19:494c:: with SMTP id l12mr29364973lfj.89.1634557182223;
        Mon, 18 Oct 2021 04:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634557182; cv=none;
        d=google.com; s=arc-20160816;
        b=P1k4Je5KGlZnbGYeWRzEnCtQhA/b7Ev5phJESuz8h1tNyreWM+WugqYHxL5qnpHKtW
         anjN+mtX6YjLsSbHTGagw3aZAYtNqSxenl6eV7LJ2VkmSp1SFqFUSHF3ClNPIdV0LEOa
         /Z32ikiiHIhp7FJfMSDkfLW5fwc/fQa+j/c5b/u4vw4mpiog/lgyquWxyj+G34h12AZr
         EVtOyeb48DQM88T5vmiw5MJucqi8M0BqTzdfHNxr/81RA1Gy8xpiL2BUtOtdJOT944VH
         Q+yfA6NNyTthV/hi+Krj6zf8qEsQwCdS34bGEi6ytmvw7jXuGT7bZRGn423FIdCkEmNz
         iLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ah+lhMG2Jiud3lY0zNMjyDOK+uDSvG3lSO1OSE4k6qo=;
        b=rpRKD5auPivVyh3ty1Un6Ldq3AdurhiHhHx/S0mn8p/Exz4v9hKXTaeYBg/QM5QAdD
         Wn6d2+ymyIupZEyg70bsL+B4Pvr8HoHlCgMVB9CpF+OpCMn6W77Zgl715dstXTcRuSKy
         FbqnHIDzN+VrBVP+KFldrnRhu+C50nQjg9FrcYVNunsZAM57LFaxPy+kOzP9UIiLBgPQ
         /IRH09Rq5lBoejhqlNwr+iiGHTl4uKgp85u9I39c9pel/DJacvpT5Q744G+cvhsHhxxR
         974bB4fkVmmW6NDPbrZ331UF/6d1eD1hy4fxX23O+DDfh9Rkw+8eC2z4DCdNG9T/lZlE
         nOlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w6si640458lfa.7.2021.10.18.04.39.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Oct 2021 04:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 19IBdfc0030910
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Oct 2021 13:39:41 +0200
Received: from [167.87.73.119] ([167.87.73.119])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19IBdeaK016022;
	Mon, 18 Oct 2021 13:39:41 +0200
Subject: Re: how to enable real PCIe device with MSI-X on arm64 platform in
 jailhouse none-root cell?
To: Changming Huang <huangcm.huang@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
 <e282cac2-2939-b868-afef-7b266b251e50@siemens.com>
 <5032fae9-5e5c-4526-a777-94ede22ac17an@googlegroups.com>
 <43b81a76-02f9-204d-059e-03aa53568d2f@siemens.com>
 <8df72a54-3bc2-4f81-8b20-9679f518988dn@googlegroups.com>
 <f8ae1dec-47ba-43f3-babf-9de6e66709cen@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <be28902a-8cd0-90de-e23e-37b42e59cea7@siemens.com>
Date: Mon, 18 Oct 2021 13:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f8ae1dec-47ba-43f3-babf-9de6e66709cen@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 18.10.21 12:08, Changming Huang wrote:
> it seems=C2=A0 msi_domain_alloc_irqs is successful and get the MSI-X inte=
rrupt,=C2=A0
> but when to activate this interrupt, it reports the call trace warning.
> And I checked the tx/rx with command: ethtool -S=C2=A0enp0s0f0 (the inter=
face
> name), I can find there are package received and send out some packages,
> but there is not any interrupt generated.
>=20
> # ethtool -S enp0s0f0
> NIC statistics:
> =C2=A0 =C2=A0 =C2=A0SI rx octets: 94258
> =C2=A0 =C2=A0 =C2=A0SI rx frames: 510
> =C2=A0 =C2=A0 =C2=A0SI rx u-cast frames: 47
> =C2=A0 =C2=A0 =C2=A0SI rx m-cast frames: 17
> =C2=A0 =C2=A0 =C2=A0SI tx octets: 41367
> =C2=A0 =C2=A0 =C2=A0SI tx frames: 179
> =C2=A0 =C2=A0 =C2=A0SI tx u-cast frames: 0
> =C2=A0 =C2=A0 =C2=A0SI tx m-cast frames: 45
>=20
>=20
> On Monday, October 18, 2021 at 4:36:20 PM UTC+8 Changming Huang wrote:
>=20
>     thanks kiszka.
>     I checked the boot log, and find one call trace during MSI-X activate=
:

What is (right) before this trace? What is the exact error message?

Jan

>     [=C2=A0 =C2=A0 2.333986] Call trace:
>     [=C2=A0 =C2=A0 2.333988]=C2=A0 valid_col+0x14/0x24
>     [=C2=A0 =C2=A0 2.333992]=C2=A0 its_send_single_command+0x4c/0x150
>     [=C2=A0 =C2=A0 2.333997]=C2=A0 its_irq_domain_activate+0xb8/0xf0
>     [=C2=A0 =C2=A0 2.334002]=C2=A0 __irq_domain_activate_irq+0x5c/0xac
>     [=C2=A0 =C2=A0 2.334007]=C2=A0 __irq_domain_activate_irq+0x38/0xac
>     [=C2=A0 =C2=A0 2.334011]=C2=A0 irq_domain_activate_irq+0x3c/0x64
>     [=C2=A0 =C2=A0 2.334014]=C2=A0 __msi_domain_alloc_irqs+0x198/0x350
>     [=C2=A0 =C2=A0 2.334019]=C2=A0 msi_domain_alloc_irqs+0x1c/0x30
>     [=C2=A0 =C2=A0 2.334023]=C2=A0 __pci_enable_msix_range+0x614/0x6a0
>     [=C2=A0 =C2=A0 2.334027]=C2=A0 pci_alloc_irq_vectors_affinity+0xbc/0x=
13c
>     [=C2=A0 =C2=A0 2.334030]=C2=A0 enetc_alloc_msix+0x40/0x270
>     [=C2=A0 =C2=A0 2.334037]=C2=A0 enetc_pf_probe+0x6d0/0xf00
>=20
>     there is not any issue in root-cell boot log.
>=20
>     which can cause this issue?
>     On Monday, October 18, 2021 at 1:50:59 PM UTC+8
>     j.kiszka...@gmail.com wrote:
>=20
>         On 18.10.21 04:13, Changming Huang wrote:
>         > MSI-X vectors translates the interrupt through its, the GIC
>         and my
>         > network device DTS node in root cell:
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic: interrupt-controller@600=
0000 {
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c=
ompatible=3D "arm,gic-v3";
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=
address-cells =3D <2>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=
size-cells =3D <2>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
anges;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eg=3D <0x0 0x06000000 0 0x10000>, /* GIC Dist */
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<0x0 0x06040000 0 0x40000>; /* GIC
>         Redistributor */
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#=
interrupt-cells=3D <3>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nterrupt-controller;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nterrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0IRQ_TYPE_LEVEL_LOW)>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
its: gic-its@6020000 {
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D "arm,gic-v3-its";
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 msi-controller;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D <0x0 0x06020000 0 0x20000>;/* GIC
>         > Translater */
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}=
;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};
>         >
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
netc_pcie: pcie@1f0000000 { /* Integrated
>         Endpoint
>         > Root Complex */
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "pci-host-ecam-generic";
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D <0x01 0xf0000000 0x0 0x100000>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D <3>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D <2>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0msi-parent =3D <&its>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D "pci";
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0bus-range =3D <0x0 0x0>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0dma-coherent;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0msi-map =3D <0 &its 0x17 0xe>;
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0...
>         > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
}
>         >
>         > and I copy them all related nodes into cell DTS.
>         >
>         > so, I need more effort on MSI-X in cell?
>=20
>         This is conceptually the right thing, but something must be
>         missing.
>=20
>         Is the ITS recognized by the non-root Linux kernel? Is that kerne=
l
>         identical to the root-cell one (just to exclude configuration
>         issues)?
>         Compare the boot logs.
>=20
>         Jan
>=20
>         --=20
>         Siemens AG, T RDA IOT
>         Corporate Competence Center Embedded Linux

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/be28902a-8cd0-90de-e23e-37b42e59cea7%40siemens.com.
