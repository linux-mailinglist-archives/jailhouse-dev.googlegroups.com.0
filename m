Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2EF375AKGQE2JTVMNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D62617D7
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 19:44:09 +0200 (CEST)
Received: by mail-ej1-x63e.google.com with SMTP id dc22sf69792ejb.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 10:44:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599587049; cv=pass;
        d=google.com; s=arc-20160816;
        b=AgXAUxRlm3lf02EkiqJ+VMAh6DnMeQj6y3vULl7Q/OONo6Ev+akEJGlso5ROUX0S5f
         y/bICe2vgs81KWBAJSHZNec4W6J/L3jxleYBYkJeBq9Cskwu0zvWIYC5hM+fbkZqM8o1
         I0CLHWKt8AkDgVNq12s9jkSruMC6ikcQGstkhW9qQWheSmxCiSkjtkZpxFEk4VOw6Cl4
         ZIU95OyW1YVZQmm3P90vFlxhrfn+RwnrAoZwrYCDtWOjwAXVDzUZ1KihzW5shCpV8Pep
         aCPBe2++kz5yNiB7Vwbdv2WDaUhpwbUVYWExciRBAFwHR9DgJxO8HYqPQQVv3ODHL5qH
         v8jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=CKv4aYfmtiYJIs4JEOqT6eIAMmi94ej0UhDytnPdPmE=;
        b=DUyu0u2dHx+KCkoFsAVb6eJty40VNjVpo+Lo2nAJqTLMYm1veB+wXBAzX7FNR3dJsh
         cqB/Ut4OSDA8XFvENPXKaxIaS5pbV0flYwnYGJgmoEF+v52GUNo2A/hxyTRCB9kb+Mgl
         fbPJNkAIUCAT7r7rPoFP3dHDIPpMKRbmA29QaiBouIG/1cPrH4Y3IsfTcaGPr/FvydFO
         kyjvYoeqblYw1kHd+v8Ssmc97wedskCVYrxOAUlF5Y/6lanF1Kgkdj5f/yXnaAcaHQDS
         +b0RCpU5KgKzM879W52phpT8SzEOvfdH+QO724X1kGvyycrQmzoUlMOqHY8f4y1DqmsO
         EDiw==
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
        bh=CKv4aYfmtiYJIs4JEOqT6eIAMmi94ej0UhDytnPdPmE=;
        b=S5Z99lcqH99cIAcUkm0ywrhJ9jggc9FfHXfExkgeY6qMqBMAeCi8VrhVSD1e3XySDC
         LldnzYx3NxwaX/A37TLwp8nAI8E0rnrgCSM9631d+tZ85LENn57Vwzligqwvge95Cm1A
         uBsMQOUiJmdevoZO0LdiayM9rC+6P0Co1LRmGqgxLrSNZUz8wmpu7y79C/A5MftdlZ1B
         bBmC8/A0obCPovJVgOyLFvLiLuYHevC0Vx8vjI2gWv9qgwNUcjAVMvEFubJ/qLf4yG5Z
         dgHmVtdYc1e8G8/DYxwhUEjyXn6NRUd09mNV2kOeHp+IKSeLV8ujDM1JEprIyhS1AW/R
         xT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CKv4aYfmtiYJIs4JEOqT6eIAMmi94ej0UhDytnPdPmE=;
        b=I9VLFcQlmaJjd4XXQz+mPtZYdsj6OAkVpZ1iAfqRkk3rt9nQhgex37kRtdl3lGu++c
         IPTXDDlOdulNBc7MxsGKq+BshMrjlcWufi99E9PmPMQz//xfqnjycUr1CC+a+yoMAFLb
         jturDb32L+/mHMVVwhL1YWbozi3R6ZLEwxvKXaTK4/1VYwjpSsBbiujoB6salF8GlLDq
         KefvnvwO0mcyzBKZ5UHS3tn8QMMo5m5yQfSXVTNC/kSTdp8/AWUBq9Hz2ONIzaVV7Zju
         3+38zyL0218taA6pvdez8li3TBAZkupyC1/nIZ4FZbjGDh31i/MUNlJx9cb7XX7B451h
         yglg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533xTZHfjXXXMqias32QG3/vBoiVza4CVWqE7f/Pze6sXG/4ooiD
	NP709LsvIRXUD2Nq1LtgM8k=
X-Google-Smtp-Source: ABdhPJznkTSIy8V6zMYS5rCOAyvvPNf/0dQ+7DYMK+oX5jBzKP4Prp/SgyNZjVdzeuva6yivZqP4kQ==
X-Received: by 2002:a50:d54b:: with SMTP id f11mr42733edj.329.1599587049079;
        Tue, 08 Sep 2020 10:44:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f849:: with SMTP id ks9ls10427464ejb.11.gmail; Tue,
 08 Sep 2020 10:44:08 -0700 (PDT)
X-Received: by 2002:a17:906:a053:: with SMTP id bg19mr27999965ejb.444.1599587048132;
        Tue, 08 Sep 2020 10:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599587048; cv=none;
        d=google.com; s=arc-20160816;
        b=oFe204j6MTnVbHeT3I09kBK1/6CuvahGENQbyyUtmpd4O3XwLXFkMIUnFiSpJrnYS6
         7C0AWMBsyi1xTZmtXq14uq6gSVA35XeI7ZSysWfcUS4P6P8dy88MVE2Yoe1rDShkCW2s
         h9uEbkDwPsIMSctvKa+NsCXmkTSpyhWobjr4p6ofPWFmcoehBg2bdiIM90VHOrMp2P+S
         FAGuvGPyxdIjHP/r7loPl6Rnq2MuNfGmXNF7XtaAZg2oCLmHklEMCXOSPIhBxScH5aKI
         5H6fV8LZNnMpA2UqzlfCrNgSGwXN8S+7u5Ri4CJBZrGoQDGC/iMXp61Zbhn2MzH4GhmI
         091A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=E97M2QbnvRe3vZ/KRR24HSvdZ819hJvMCikXA1A+b94=;
        b=xFXTI68o0xSKuYt/sk1ccaYb4AWFLfj1MjrttdXjSETeZS4+7Qg/Oa3b40npOLuL9u
         GXmtlTlz98Mvpl5i58kYaBos+xcJk6S8DdhHQKvZeDlAKihixcb9GurS9nwnpbD0vl52
         APdQfplBAY6CRDgcYRIs0AKI+PBZECy8abMaxg/b9uHd+TFN3H3ZA6GAK48ZjKU0WaN0
         Mx4bJw/rXR3hutDhOSDPpSV88cx8n/+ca4P9Vj4d83W/ZHusPN5BiPh2RqRQtH8UTN01
         11lcwqK5hPnL0dceAySR0y87aulFwOhhXtMAglIsk0+3/puWShha7KKExa/fIyfkyvs4
         MuDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id dk15si4139edb.2.2020.09.08.10.44.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 10:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 088Hi7sD019964
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2020 19:44:07 +0200
Received: from [167.87.17.27] ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 088Hi1gW002556;
	Tue, 8 Sep 2020 19:44:04 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
 <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
 <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
 <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
 <e0cf2959-7653-4fda-93b5-5abfdd188414@siemens.com>
 <0cf9a640-02d0-4928-873e-08d407bbed17n@googlegroups.com>
 <4fbc4f7c-de79-8bbb-357e-f5a056698f56@siemens.com>
 <14e0bc1b-c52f-492d-aad1-a565969f73f5n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
Date: Tue, 8 Sep 2020 19:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <14e0bc1b-c52f-492d-aad1-a565969f73f5n@googlegroups.com>
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

On 08.09.20 17:29, Jan-Marc Stranz wrote:
> Thank you for the response!
>=20
> The linux kernel created as described starts.
>=20
> The kernel configuration option "CONFIG_IOMMU_SUPPORT" is set (
> CONFIG_IOMMU_SUPPORT=3Dy).
> All other configuration options with "*IOMMU* are not set (as I already
> mentioned).
>=20
> The kernel command line contains "intel_iommu=3Don".
> "dmesg | grep DMAR" returns an entry "ACPI: DMAR ..." (that is new for me=
).
>=20
> However, I still cannot create a configuration for the root cell with
> "jailhouse config create"; I get the same error messages again:
>=20
> Traceback (most recent call last):
> =C2=A0 File "/usr/libexec/jailhouse/jailhouse-config-create", line 270, i=
n
> <module>
> =C2=A0=C2=A0=C2=A0 (iommu_units, extra_memregs) =3D sysfs_parser.parse_dm=
ar(pcidevices,
> ioapics,
> =C2=A0 File "/usr/lib/python3.8/site-packages/pyjailhouse/sysfs_parser.py=
",
> line 377, in parse_dmar
>=20
> =C2=A0=C2=A0=C2=A0 raise RuntimeError('DMAR region size cannot be identif=
ied.\n'
> RuntimeError: DMAR region size cannot be identified.
> Target Linux must run with Intel IOMMU enabled.
>=20
> So I still don't have "a booting setup for Jailhouse"!
>=20

Even worse: You do not even have a standard Linux system being able to
use full virtualization support of your platform, e.g. via KVM. That's
like trying to build desktop system without being able to use the GPU.

Again, you (also) need a working kernel with INTEL_IOMMU activated. Boot
a live stick or any distro image on your system to collect the
configuration - and also implicitly check that IOMMU hardware support is
fine via Linux. After that, you can switch things off as you like and
fiddle with Yocto.

> What do you mean exactly with "you will still need the Intel IOMMU
> parameters"?
> Do you mean the kernel configuration option "CONFIG_INTEL_IOMMU" or do
> you mean the kernel comand line entry " intel_iommu=3Don"?

No, I'm talking about the fields in your system configuration that
"jailhouse config create" fills based on the available platform
information. But that is not fully available when Linux is not fully
using the IOMMU.

>=20
> Why is the option "CONFIG_INTEL_IOMMU" not included in the configuration
> fragment "jailhouse.cfg", if this is required?

If you are talking about meta-agl-devel: I suppose that wasn't targeting
x86 so far.

>=20
> I hope that at some point I will come to a system configuration that is
> useful for jailhouse.
> I am already using everything that is provided in the "meta-agl-devel"
> layer with regard to linux kernel and jailhouse.

I think I described clearly above what I consider as a more reasonable
first step.

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
jailhouse-dev/992cd8fe-ef09-d0bc-119d-e488de158759%40siemens.com.
