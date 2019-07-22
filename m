Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2X62XUQKGQETMLOG7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2926FBFE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 11:18:35 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id p3sf8346400ljp.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 02:18:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563787114; cv=pass;
        d=google.com; s=arc-20160816;
        b=jYeQvHdBDpdpHp8z5nR3iLxVzZODixWzKijSHB5F+nN1N8kD3nAfig5AtA8kJGkXPh
         Ziy5CerKw6bN13W3+glGrNa7oQKqjWw8w/DnK1VBcymVBZaDNzaJ6ewa6D9imnjeM8wG
         a9idFcNC9Y4dKf6ddj0VgqiIhXAJFP/7Qgf+FXUZxR/tpdAgpSdwNwSuq/HfWvqsy/QS
         dcae35CCe01GY9jVlphXWn0TzIF+omowW6h5iYAzbaHPMVqiqj3BXnXyLESfkCMeoIo+
         PT3gQ53xcn/sOXgyqu7Ou6tbb1vfpg9CTqv7VTuSuCIXyO7ast+R+sAoZt9wBz28osCL
         N3yA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=aZh1mObtgDSOp3m8Mv6iR17Odcze0ZLO4fARu4dd1F0=;
        b=FjzFsh4PpnK1wlIPPUYnHc8KDN5/qeR0+gC6+h7NOqaQAVv0PvuaUxsnYltF0KYnYl
         fbyzaptSjM2t24J7Qcfhq5WtIJVNbkmS9oq44AZbscPpSNQ+MRc5mYfRbOpuHG0xcpCZ
         l4IMq2GN/tSmkpSzxJjZ6jqXGx7ZCYKYKuqgCSHHgUUfBl41UtzQ7WTPTyAti2LrU/sp
         dVPJpyUt5Q+CbeJG2HRP4pFhS9OAozRBGrjYQW2OuTBeFURh84Ck0gcdjt9wUnHPB3JK
         xRRnhPJaHvDyv0Tr1rIeaXvnbs2ucnEJD9/Zhy9bjRS/W4d89GrasdKwQoCsZ3tAOXED
         yTLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aZh1mObtgDSOp3m8Mv6iR17Odcze0ZLO4fARu4dd1F0=;
        b=g6SaKkqY/Y0a/VKNAr1a6if3BF2bszn2U+cMN2R9m7p4JAJoJU0vAxio0MMqlnuWTq
         vxLa4L190aiNbK4Tx+Z8oLbVB987ZM9ETmf/jE5ydEswVyYdXyhccDTTAbCmIwBvgL1g
         jfCEVk9eX+j/qSVjUuIfgyvXduur2pcb76/8FtbxLjS5bBX0laJ6NpdxrcGdV/tLeCtq
         +w/9ycn6DXR9kSefQ9ljWplPzEp2MiD9sl5svoNQdnPnvtuxQGyIam3gjtV+6jkU7gwK
         kCdPIGLocB2U8bYnxYKKRJzOSDGNvYvVtUH2q5N2dWUBxebqpFPw7dEc/bM/4s9W/EJE
         kbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aZh1mObtgDSOp3m8Mv6iR17Odcze0ZLO4fARu4dd1F0=;
        b=G2NXY4DTpBC2XzN0cf6bSu7KixJVZ95dYytRUvck9ByOHUUyrzVPw0BL7A5xym17p8
         LX64Lm7ekuoel2DUaBNg7e0kLOhGgkc78DTViH3VUR7Pthn5xNjbSrbQ7MM5Vb/VhsnH
         D55f//J5Oh3Wr0hXsgxuak1/FE1fb3SEFbWuPg2g0a5FA+Y0XBxAOM2CaGaiOMf5AVCP
         qqsfoZLwanGqngXp40RTAsDN4SkTnd7/lpbQaBTc7UFQREQyNMxD5dG/rfUJydue0J+s
         9zBSyXRuSlvu80mZlMxx47j/S7KmSfUuYIkRbdkhj+mKhy6t00bu0LnWHZe2JxTvLfbF
         m5jg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrn4NJzYJAuaw4l08uiUvQ7FVKc9PQ3ch0ADa2djEOIfh8nL+4
	oudLywcvhdu6RQ4X1cYffn4=
X-Google-Smtp-Source: APXvYqxOa/DhSUIqIoPFidshZj5/sLsksu8C9i1ToaWLJVLEDfpudEnmj7t8hAOyP/Hd+czzQN+ZTQ==
X-Received: by 2002:a05:6512:15a:: with SMTP id m26mr30584698lfo.71.1563787114889;
        Mon, 22 Jul 2019 02:18:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:998e:: with SMTP id w14ls4364680lji.0.gmail; Mon, 22 Jul
 2019 02:18:34 -0700 (PDT)
X-Received: by 2002:a2e:8ed2:: with SMTP id e18mr35582082ljl.235.1563787113984;
        Mon, 22 Jul 2019 02:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563787113; cv=none;
        d=google.com; s=arc-20160816;
        b=h5bMj4wjNTdEuGMxbsQ9046QULAChntNvOGJz3hmvlLJ2X+8vDZ9fJubB5/3nOXi3v
         pg+R6gXUZSInUIIBLfXMBnQCBciDl8szaVw4tDvEAptHQBzFEidYCX7JDG8Cnf4gwXlv
         iTHygdZ/jJWNocOu8F4yYRxpSbXfVlU2YhDDev4SMuVIcb+JKKAo+2SbyG7snXfvvJ+W
         LUlTWAnEf8s9ShJ861h2ZkKEgIcZovHtpkWE720B4uRTlkOJ/NGqxmXOwms2TWpmIf1+
         O1QUBJJIIgSCM80Odfyu4IzJ4NLXwT8SyQQUB/3duq0w4wQZvgdWMiJ5gVY9YEVUnW3t
         V+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=M3vrnxICQNNBWOCrIIVbsfxGvXI67Z1gPigof/UAmps=;
        b=BeF5Ir7caBgrI6f3J33NT0lOJzKbt8TubxlNWPT/HhE25zn4kjPJMTDCgSYBYtVPxO
         e16Q/FTq2PvNYukTbj0ffchKUMWBl/yBoYCSVYO1JDW/5XudiPQsQWmULU6pK3eyItaH
         JosvmTNdEuOC9H+v3RLTErbL7lRqq58PR+cjQrqttfzCUn4gz7FJaviu33CppWaiCNnL
         a7jnMLeVBKMScPJSusxIS2lVzvX+8KtwysYiRGuE6s/o6/pUckf3huliL9KIF3qz1nOs
         iYevwaAWiibogyi/Vz8xOCqVuHTw+uK1EaemRFXl4881uz7l51fH9jLlREEGd8zZr5+A
         gP6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v29si1998149lfq.2.2019.07.22.02.18.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6M9ITXR024274
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2019 11:18:29 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6M9ITEs010083;
	Mon, 22 Jul 2019 11:18:29 +0200
Subject: Re: 64 bit Hypervisor crash at 32 bit WFI instruction
To: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>,
        JailhouseMailingListe <jailhouse-dev@googlegroups.com>
References: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c5030c63-c5d7-e64e-63cf-91ff69638f0e@siemens.com>
Date: Mon, 22 Jul 2019 11:18:28 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
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

On 22.07.19 09:19, von Wiarda, Jan wrote:
> Hi all,
>=20
> we implemented support for Jailhouse 32 bit inmates running on 64-bit Jai=
lhouse on the i.MX 8M Mini and it works fine, GIC demo runs without problem=
s. Now I have one problem, that just=20

Cool! Could you share patches already? Most - if not all - of that should b=
e
board-independent and would add value to other setups.

> occurred. I'm trying to get the ivshmem demo running in 32 bit and it doe=
s work until it comes to the line
>=20
> asm volatile("wfi" : : : "memory");
>=20
> When I give the inmate CPUs 1-3 in 32 bit mode and the inmate accesses th=
is line, the 64 bit inmate CPU 0 crashes. If I comment this line out
>=20
> //asm volatile("wfi" : : : "memory");
>=20
> both 64 bit root cell and 32 bit inmate run just fine. Now apparently the=
 64 bit Jailhouse Hypervisor has a problem with WFI beeing executed by a 32=
 bit inmate, as with a 64 bit inmate there is no problem. Is there an expla=
nation for this behaviour? I guess I will now have to handle the WFI except=
ion. How do I know the inmate is exiting because of a WFI, all exits I see =
are these:
>=20
> #define ESR_EC_SMC64			0x17
> #define ESR_EC_SYS64			0x18
> #define ESR_EC_DABT_LOW			0x24
>=20
> In the ARMv8 manual it says, ESR_EL2 has an EC =3D=3D 0b000001, that trap=
s WFI and WFE and there is a define
>=20
> #define  HSR_EC_WFI		0x01
>=20
> but it's not used and it's for AArch32 only. Now I wonder, what's the bes=
t way to handle this?

I'm not into the arch details by heart and would have to read them up first=
.
Maybe someone with more background is reading this and can jump in.

One thing that comes to my mind, though: Can you reproduce this issue in th=
e
QEMU setup as well? That may give more insights into what the hardware is d=
oing
here and what is considered problematic by it.

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
jailhouse-dev/c5030c63-c5d7-e64e-63cf-91ff69638f0e%40siemens.com.
