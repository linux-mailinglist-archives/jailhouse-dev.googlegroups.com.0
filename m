Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA6E6T4QKGQENVWLUCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B43249ED3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 14:58:43 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id h7sf902964wmm.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 05:58:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597841923; cv=pass;
        d=google.com; s=arc-20160816;
        b=crOkewxXOLdC6p/SjL+RA/R7092EF69qBrdK0DRW8D/jPASslW1fytP6UbTD8JXkkM
         5cgpLk9/UXv9WTxIG7Qn0Cg6/zF/ttB2yvTT6TxG6C2kvfBbr7h+QMS/foNRkRCd4jla
         FzY6WbIrVfKBU4dB5QXedpAyV6gyIAzdcectpMFnAivSCoEcR+6W8W7wRWFszwdCvNNL
         XzJjLINlo7eGt7B3Dc5ckYtSKDi3+MVbJF00mYGE5LM3qTEtjqlFp7noHHe3V8fBIe1q
         KHfizB+XuFndIu+PFURcz0JSzzPJf0uiqkYEWX5eiclqOLWFMe/tvqvgRAby7YLAwvvW
         6FAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=H5TerMWzdTJIod1B1I6uXhIDShDUIXV59CAcKZRNmjc=;
        b=MgVkaW+vNNZDglepee9zTWAhAjdNoxqRVaVpBDGN56cjqwyRKJnKn8lPZRDk7q7BxF
         0CbiHt9mrisn+uNnoU+ib/NDHee3NQc9DLQCoUKyYWbkzWXbyySrDNObEiwgnkOy2R+L
         Hvhw7iL3O8WHBvIh7ygDFWf31m22zPq+qWmy3s1x7kpXODVtJZKenSod3Xv5FAEgv2/z
         0cV+IwsVilrYqcgF3iDRddyjRHNcXqTDU0VUkozKZAsBFLiJAGA8JVtJz0Bc4cP6bBZi
         3BIvoeP8O+8c8fBn/JBCAa5y42e4Hv+iTLGTlE+Yybzx1z1jk8JgJZT5VwYSRRmYWILp
         +Riw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H5TerMWzdTJIod1B1I6uXhIDShDUIXV59CAcKZRNmjc=;
        b=Z5OMgsFT/hZTziDkQb7h/+2G57094boqrnEy6rF6caOx9CerfujEWPZrbEZbncjZS+
         6U0d978dr46ns1n1FsZZsxNaucDc+4BM/X9zr251rs6fCqLLnvjKnCHQ7vXokHc0Iu3p
         KuSijW8gyrGSawYhW+x9R1HnxGnQZ4sNMj0SuFLXCBCEDamKD23NfaQ3mSIjSPGDipWo
         ScF+eaOaPXLSW69L6BrqA6LxD4g92AL4T7Qa5mY7x0z1jfwr9JcoR1Aga4uIX8NgH5So
         QAowbZk7/NE06dOZ9l9iXEddK52GfSdL04S6fS6NrIg5hb8OkUXijqF/nSp6Ckko+HOJ
         AywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H5TerMWzdTJIod1B1I6uXhIDShDUIXV59CAcKZRNmjc=;
        b=LwDv1mZNXDh4NX7PES4aoqEPM7aZe7v7FZ/HBCdfxlMDZUKGtwXZLBN/XZ+bUbZZfz
         XQ4bhGChbgLe7fE4UI7vBYWhfJaORUx31X60jfVRySIq3nPDHFE2R2NVDTWz0YO2cHDv
         dsxaOSYAYH9tUHB64AqcTD2XMSCbmj+Xet+i/j3CVWGooGs5U80iURm0L2i5ZoZ/aNoj
         3HgDRWAtVElfmr/3poO703VVAi3pa0ZehAIvDnUGz3wod5oI/O/YxcNY1Zj4gh+8fLHV
         dAOv8YVyFD8XMLFk2pd+sJs7GjB5/XesSuQQRaocF1KpwpCgfgSJe5EilcNxpKKM1t9x
         sfBw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532pSXOSbqcM37HZ3exvThpamF6m43/7dCTbJQFoy++l/DFP3o1J
	QdIB01JnMj9OZ51d+ll6xmA=
X-Google-Smtp-Source: ABdhPJxF2yOEqQOPl/lL9fK8uKrK3WlqQdV6rJA7oONVzxo3Oes+x3+sBO20eNWJjtfUbYxFhMyRag==
X-Received: by 2002:a1c:818e:: with SMTP id c136mr5030573wmd.170.1597841923682;
        Wed, 19 Aug 2020 05:58:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls1092465wra.3.gmail; Wed, 19 Aug
 2020 05:58:42 -0700 (PDT)
X-Received: by 2002:adf:edd0:: with SMTP id v16mr27055500wro.271.1597841922615;
        Wed, 19 Aug 2020 05:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597841922; cv=none;
        d=google.com; s=arc-20160816;
        b=mcNel3F4swWwrNfNdeSgqqlDmhBLzPT8hdEUN5cIpehbOLuuG0szZ1aw6mVd7MePCg
         w2qEv7Ctc89WQV1H0N3ISsgVMW5hEJcKlUfxrJqJ8HZI6dwvF2P5SEwSCUFiumQrFTXy
         bKNXd06c8Pive4JH4J+zICsA/hOuAqCE2jwHpjQpk2MEjYbBESL4Cdw5pGXBYmrpY3c3
         6b33PJTZQBeJsZjIXt6+PbEzewRswIY0wQlmIlN/+6cEeCyaipQUmXCV/QCZyvYF5ViD
         wwTFo2mmKhqHW1PUtCFy3emp45FT6UFhyh5hpIdgksm1t7B4tmAoO3bmfEsm77z5JB1n
         efTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=jAyxN3st2d6ysCa6iIZpK2mdOTVrfhiW55AiNIPIRqY=;
        b=kyt3u/k9nGzAW3LkxlYYHDl6GpXwUo7F/9/a1OTuU/oST4exuVg2Z55gK4BauXHppR
         DnBbuNQfC8wcXCF5o73JVDFwdAw2l7LWy0ovlI7x08n42bG6WhDlcC/UzsUDAzRk71ST
         9mN6Ct6N8dW4Tk1ktqXLMgifuMxIPCbcsz7hentxpPzPNEdmdpb9XLtthq4Zu/lQGG7K
         Ca+zJyOuFI8xlNT9+t+4CeUWWuOdE3QJ2z8QBV5aRdKlbZ3J4mnEVzUdSHMeLlqk92gj
         dv2WlYLn1MwCUnnAoSw0nVTi3wZt2YubBeZ9VmtUtmV9NSYcKenxav2nUiEtJLXWQhel
         ZT4A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 92si589313wre.0.2020.08.19.05.58.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 05:58:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07JCwfwc012844
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 14:58:41 +0200
Received: from [167.87.31.209] ([167.87.31.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07JCwe7s017564;
	Wed, 19 Aug 2020 14:58:40 +0200
Subject: Re: [PATCH] configs: arm64: Add support for RPi4 with more than 1G of
 memory
To: Christoph Gerum <christoph.gerum@uni-tuebingen.de>,
        =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Cc: jailhouse-dev@googlegroups.com
References: <20200817171736.78100-1-jakub@luzny.cz>
 <57c67012-fee7-d7f1-1201-25415e39034a@siemens.com>
 <CAGdCPwtX9JoP_RocDeB-MF3XTz+yyrXYL2LBCOs_-xa_TVA6Ug@mail.gmail.com>
 <83d289a5-8928-0fc2-68aa-64df76e8ee16@siemens.com>
 <32baa43a-4e84-7f22-230c-bdc5fba33c76@uni-tuebingen.de>
 <CAGdCPwuAGqYaeUik+c1oFX=Zo3JmDmm1JdyMiYPPVyi4ovGvQg@mail.gmail.com>
 <07e0e959-4d93-58aa-4720-356d3bd7066e@uni-tuebingen.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <66a1c16b-ae44-693c-abd4-512f42d4e4d3@siemens.com>
Date: Wed, 19 Aug 2020 14:58:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <07e0e959-4d93-58aa-4720-356d3bd7066e@uni-tuebingen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 19.08.20 14:41, Christoph Gerum wrote:
>=20
> On 8/19/20 1:31 PM, Jakub Lu=C5=BEn=C3=BD wrote:
>> On Wed, 19 Aug 2020 at 13:03, Christoph Gerum
>> <christoph.gerum@uni-tuebingen.de
>> <mailto:christoph.gerum@uni-tuebingen.de>> wrote:
>>
>>
>>     During our work on autojail we also had the assumption that
>>     .pci_mmconfig_base needed to be below 2^32, but we could not find a
>>     reason for that in jailhouse. I was think, that this restriction was
>>     either caused by the linux driver or a misconfigured device tree.
>>     But I
>>     will revisit the problem in the next days.
>>
>>
>> I have been looking into that and the device tree generated by
>> Jailhouse might be the issue. When I move the=C2=A0.pci_mmconfig_base to
>> 0x200000000, the generated device tree looked like this:
>>
>> =C2=A0 =C2=A0pci@0 {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-coherent;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0#interrupt-cells =3D <0x01>;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-map-mask =3D <0x00 0x00 0x00 0x07>;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges =3D <0x2000000 0x02 0x100000 0x02 0x10=
0000 0x00 0x4000>;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "pci-host-ecam-generic";
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D "pci";
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "ok";
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D <0x02>;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-range =3D <0x00 0x00>;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D <0x03>;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D <0x02 0x00 0x100000>;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0linux,pci-domain =3D <0x01>;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-map =3D <0x00 0x00 0x00 0x01 0x01 0=
x00 0x96 0x01 0x00
>> 0x00 0x00 0x02 0x01 0x00 0x97 0x01 0x00 0x00 0x00 0x03 0x01 0x00 0x98
>> 0x01 0x00 0x00 0x00 0x04 0x01 0x00 0x99 0x01>;
>> =C2=A0 =C2=A0};
>>
>> At first, according to [1], the #address-cells must be 3 and
>> #size-cells must be 2. In Jailhouse, this is taken from the parent
>> node. I don't know if that might be an issue.
>>
>> But it's weird that the reg property is just 3x 32bits. According to
>> the Jailhouse code at [2], I would expect it to be 5x 32bits long.
>> Doesn't the kernel think that the size is=C2=A00x10000000000000 or
>> something similar?
>=20
> That is correct, reg property is defined by the #address and #size-cells
> of the parent node which are 2 and 1 in this case.
>=20
> But one needs to change the reg and ranges properties in the inmate .dts
> as well. At least i think, I forgot the ranges last time I tried.
>=20

We need the that mmconfig resource in 32-bit space because the jailhouse
driver appends the mmio resource region for the host controller to it,
and that region must be 32-bit because ivshmem devices have 32-bit
resources to be placed.

I think the RPI4 has some space that that, though, somewhere in the
0xffxxxxxx range.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/66a1c16b-ae44-693c-abd4-512f42d4e4d3%40siemens.com.
