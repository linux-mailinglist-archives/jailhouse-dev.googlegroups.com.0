Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB64BWCGAMGQEGQOZWAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FE44C5EF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 18:27:23 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id m1-20020a1ca301000000b003231d5b3c4csf3411202wme.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 09:27:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1636565243; cv=pass;
        d=google.com; s=arc-20160816;
        b=0/PYXr04n5GU1otIImqFCiEtu5U7+qqlTUiTEDWx1TtkJ6FktUNZIODwkVWz+p+B/R
         Fg+EPVlLGrjGYmfiVAZVLQzY681x959wuQDLxm4y099QrAUjKblsaOEssG4tLv0stJMY
         H/tyWGQBux7XdEPAeAk9PqaKeGX7btzIvdpmGkNv4meaEBmZCFKHGuc/SYOVEvfnDOA8
         gOadTGyDIu1vA7A9xrr/4xyNsPPtsDPs9f4yrAMRfDZ/PK/TyqtVU2E0Fgy3+8jbpiui
         /7gXRJshTFUeI9Zk0xqXRBMd0G3NnkfSnSi3HGBkFNgbPS1YzL27Wf/d8Qv/9icOSWjb
         +xcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=G5J7NCp07oFyo29XVqTAwI3jKRzolJ5+JEdAZYDHG1g=;
        b=aQn6eKGRTqzVtPA4JmX4mLNP+q/DdWQ7uh4k/f7GOEdUeQIXYdV6hd9IJkQFxYP6Bg
         Xe+fNf6nqrE5n/pbLI9R85pvu5G4Vfme3jAPB3jHHaNVr59SyaAfSaHQp43iMetPOeQR
         wgqoVyxTsbT15Jp+9F5bFrQOSQRG3YWo+5Y4hmhTUCXjl1gDlIuQOjrBwCsqbNN6WUOz
         W829JUfPqWs/U6OmWF1LykTld5VtG3oHrF7b+te7ycBzctqdV0GGwbtN0i+zQv4wfHCH
         AUWhJuoVvp2C4FiUYYrvWbwtLCPEJU/dv10QOqpDYxlaidnaMDy4NX+HSCZfrSkrQvUe
         SJ+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G5J7NCp07oFyo29XVqTAwI3jKRzolJ5+JEdAZYDHG1g=;
        b=lcu8/Zj0vkfaaRDJuKnWHCQDbYDJHGpV3mDU17U4KugSBXJGx3BZXgamgz/fpZ3s3n
         E8PsxFFJKN3a6BlxD7dxLolr2sIqQ3gdxSty0YGn0/v1ZjmzzzyZo2VGo5evpmm1jnJh
         IBGu0dzKKo5bgj6Ntpu1mzUapX/jA3DYujX9LxM0o+HFVJW9Poju2S+hmO70yl4HujRp
         y7vzxix1fRbMzwORLgh3VX2aScYA85hcfuIj9FQNjsuoQTqH47udb5qah+ibkvZh/+Bo
         h+e6sAk2Vb+GX2B6G5/Z5P7SuiuAphV8gsdHJu6OFZmFlT2dq6OBRBklUGOZi9HgJ1xJ
         Zlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G5J7NCp07oFyo29XVqTAwI3jKRzolJ5+JEdAZYDHG1g=;
        b=DAV+ubkBKr5EwkQKlBpS1onWJp+CWN+xQoos/Xd/YQynttPUzQ+ftUX8L9VnqIRut+
         Cjsw+APvY3kcsGKMu84EQEM3xYhDatuepT1mDSAL1BOIlhM0ndnIhsC4MMyB25fQy86I
         5hz1+XUvbmvDyAAyJ3O3sCBNtdLa+/O2+F65BaOQAHrSglSorSnZNutiqDmuCcoWUNw+
         rq/p/rMMAiMWNpY1Ohp8JeDq09qmr9OHWPx7efsxpb7OWpkwAb0BRKn4wfAeTTR4G18F
         YgMezBWYL1aRA1GXF2VUKQku+xQJR+AxPsYB6k6jwnqSPU91N4SG8lFe92eFtGayCmG9
         EKzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KePeHgUmfcn/9Ibf3QNKWWpNcQLxWLDtutat6CkwOy+/ovuyE
	MfURO+QLuIGGhEHLmE6IGjs=
X-Google-Smtp-Source: ABdhPJzf7XAbMezITBrNAdNyZtWaQRewjfWfqzjQ8Mnnfb1PbvCQ5bQxrHWADHqVNVRV+qjIGW0MZg==
X-Received: by 2002:a05:6000:1048:: with SMTP id c8mr122503wrx.352.1636565243615;
        Wed, 10 Nov 2021 09:27:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fe0b:: with SMTP id n11ls790769wrr.0.gmail; Wed, 10 Nov
 2021 09:27:22 -0800 (PST)
X-Received: by 2002:a05:6000:1787:: with SMTP id e7mr733378wrg.433.1636565242615;
        Wed, 10 Nov 2021 09:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636565242; cv=none;
        d=google.com; s=arc-20160816;
        b=bDj7nhmHMOM9JBYpD6P/QXvCvGUnfddEZfk0nJgAFC7xFKMiip0i6jSlWoSVgKLm77
         IQpRa4piIvmjN8RypsL7SSUsXYj04bogOiyvaSTTZbqWxihSoRpBIgvVIpScfAGm+orO
         jm12DxOGV84Syu13e+zNVjK9F6VIOvC7pfj+LGkQZIMuj5UrCtZckDObeSEEdLRJB4de
         MlGNg0F+d+2yeMt5GfsL2u/rXporZsB6zLEdJj9Vpda/7kjVKM8DA5U7LRYMJSZGmnjU
         whumV04mBudTQ3AXa/zGeaoP0Pjp4Kk0Wyj03DlFG0BEaEfCtnNckoZkzXeMaLq1eX/y
         apmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=G14PlTpUi6sncFoYGJQ20f922rGhEvS5HC3MJ3ioGb8=;
        b=C+9fKTF5HgQ0+ppNopxbD4MDgrMiuXsYozLIEGBJ3RUIDyyoNY6wxZmMpYgvJYpAWF
         tqhgYNRiDiSppNzIg50Josf1HjSx+qVkiO3nlDUOnldEWdQh+qAh0/XcGZa65sReyN2e
         RZpTLXsBg3qiZe9xTv+tVGSRrFLxQBmo3eog8dWQFFCY956hhOq+km+EM2Hj/ooqYSDc
         J4o28nCMf3V3g0j/5ahFXF3EVKUeohGrjTsgQt3ztUgUf2qo63Q7+UpfcvInDFdOTssP
         CdkVWFJ2SYucnBX7ywEo3iHzTFmxnrcM8dKOkfGp66eNxYFCSfrBd+QZQ7s7ijUX6kS+
         9OrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id i7si40195wrc.4.2021.11.10.09.27.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 09:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AAHRLtR018246
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Nov 2021 18:27:21 +0100
Received: from [167.87.75.31] ([167.87.75.31])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AAHRL6G026858;
	Wed, 10 Nov 2021 18:27:21 +0100
Subject: Re: Jailhouse cell linux
To: Moustafa Nofal <mustafa13e09940@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
Date: Wed, 10 Nov 2021 18:27:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 10.11.21 18:01, Moustafa Nofal wrote:
> So, I had a 5.3 kernel without PCI in the device tree, I upgraded to 5.4
> and the PCI devices are listed. However, Jailhouse is adding on the
> terminal two PCI devices, but there is no effect and the virtual PCIs
> are not listed.=C2=A0
>=20
> My question is, what does Jailhouse requires to be able to add virtual
> PCI devices?

You are targeting RPi4, right? Again, jailhouse-images has everything to
get the ball rolling. From there, start exchanging pieces that you want
to have in a different flavor.

Regarding the concrete question:
 - either a support physical PCI host controller (so far only worked
   with the old Seattle board)
 - or a virtual PCI controller configured in the root cell config (see
   configs/arm64/rpi4.c)
 - support for CONFIG_PCI_HOST_GENERIC and CONFIG_OF_OVERLAY

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
jailhouse-dev/a18b655e-fd9d-32b9-6e10-acf1fdf91661%40siemens.com.
