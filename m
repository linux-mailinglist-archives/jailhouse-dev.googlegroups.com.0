Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKMA5GCQMGQEJFNTVSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id AE37639BB5A
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Jun 2021 17:00:59 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id r15-20020a62e40f0000b02902ec871096d3sf1248632pfh.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Jun 2021 08:00:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622818858; cv=pass;
        d=google.com; s=arc-20160816;
        b=i7/APY1fbpZ+9KZkJOhUWjFOhFMGhPidNk7kZIODXhu6XJhjfBS1eQ1iqNR+UhBikL
         FeZ+xWayls3T0Wpnbiy/u2KluxSV1dyp5j7+EblrXEPYj08SXraNg27GRw7Z/Z4/tSoS
         KAxtKGvCgUobhSExCZhwPfdukNEowB2a+Mf/D1YYAJQPl3Lj65vKvJo4G3HMhUXVvXi8
         54D82LXZjIAEfryCZD+OFbK35fup1ibubUSUTO7bqDZivtDkESnEZXEkZP1bHH4erAY5
         eA1AeCGlM2/fzOHdkmZFv4NSTic+u2YvkFBl/5i3kEynWswtqjjNd0iAR0tsVlKElzwS
         Pndw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=y4NRBuDU5sj2MZBmSiwlilfRb14laPLK+ZFB62d4uHU=;
        b=Dt8bj02wFvtfAVc6I38QqvsycE6Kbrw7pWhh9DChJtv66RO7N700VSJgXCtIMKDydc
         iriSacDkCA9B/SNe32vuKZFRf0AZPWGL9fsYkeg80vN0+M+rWKL1bE/FC7HWQekE3q/s
         Jmy0BLa2wkGYhYC/OmM6hqHNjgva3KmVahRi+ptpFSoiBSGoZzoigXn8wqqHQOvxNE63
         gZWFTH8ppmedwN/V/MCcw9EsZF8mEcOjth1R6ZIcmM/DxxGna/h9jrdGTRLBQeaa1NWz
         bl6qIZGt1YY58fq89vRbXLXKDDRB6xZ1/WjDWXg1BXKQqXIB3+THlsz75EN6/KBLDsQR
         Dd3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y4NRBuDU5sj2MZBmSiwlilfRb14laPLK+ZFB62d4uHU=;
        b=qf3r5UMf/WgopEGyUOZ4/f3UIZQ+UDbu3aZYvhzBHqC8DrkuCA3BV6GdNZuRNaS/L0
         OivSMNB1cXaeHVA5mRB1uVjoO+61L6E0kuoMOaC82G1bXhVqGugeNZ3SLv/bEGBYPHqx
         JGaz3ArBiCm7qWnpY7LUzXu7KAAp9ZuzQLdrB9nADLhj/1y/SIWO7UXtbIms7JIP+8Ln
         mvC5tfWJduwu5xXChI9dfdiAM0ceXqyrbkHHcGT60MWzm3iKOJ+E8w5RhCGOBE/5zUTe
         6TVT6aPEBOsmieKGwXjvEWRRav/poRKnJ/tPJPsS6ePohgQaqUr0L9fYIg7xO44gNMTD
         6cPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y4NRBuDU5sj2MZBmSiwlilfRb14laPLK+ZFB62d4uHU=;
        b=NeMt2hW1Txee47Eml+PZ86F3QCnw2vs6C7nigiSBPhhC8w5f8FBgBSlZpODTECwhJZ
         PDN3P5FD3LWM8F0nzr/fxI6hC1LkubZ+tOHMgqu/TVKrJcMHzK7f0DCEkCJ16snU/ls1
         m1JJqT7JnPCg0pRLZy7tyxoOUQ8KvhopwuXv2xNCQHpRoEQQV7IVYVQ/A0wMhFs9+EgE
         L5nfEKlBytsdKcnHX9sTQmFv9tGW+6TIB+h4HBCjVXfDl90IaxIvkNnkcxbKFzmtSZvz
         4RrbmrGbj6wCRUSr4ANOzMGVjlYeenkqVpChvnp0aLFF210lTZjAXQLWNvIS0ud8ckRr
         u8uQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532jkr7pTtSYcDfh2OKU3YdmZwEXKx8FVoSUegdWCma1aEUEQLla
	1pkIgZTcAAY/pYy7Gczb370=
X-Google-Smtp-Source: ABdhPJwbVR5j30D1G91S7XNw649LFZp/0/A2923b1SVDigLcNcq9lYQt+bUHAVsH4grjj0eXZ2XLnw==
X-Received: by 2002:a17:90a:738c:: with SMTP id j12mr5353566pjg.150.1622818857997;
        Fri, 04 Jun 2021 08:00:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:7042:: with SMTP id a2ls3881897pgn.10.gmail; Fri, 04 Jun
 2021 08:00:57 -0700 (PDT)
X-Received: by 2002:a63:5553:: with SMTP id f19mr5302135pgm.419.1622818857290;
        Fri, 04 Jun 2021 08:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622818857; cv=none;
        d=google.com; s=arc-20160816;
        b=mzDpWuvGCbJ/T5WlBDwd0soSi4bUYQxrcF6aXnl0e7WjQ2pWdqqCaM5eQHraN25GUW
         z9uN4l1IdOLwr+bCE7fz3rMednjSUWf7PKr5yr/hEz0mH4nJ2eL31aqkAx7x1UUIz4Xx
         UEGDa0Fle+OL/LeHy9FXdGjF1p/tiuKzYlW7vv8EIUn6iZuwRPmqIYsk7ZKAJdRNAUbX
         +BJalTMsCbQgM05s98CfUxOft/clVLhyIeeDct7UcfkbWzVlR/v/CJ9nKpwRXKygt+hD
         vcNd4Cw+jBw2hkqsrsV5jxHjHifp4OyCf7FVYGCsaEQB0se3NDnl/PHjRqeWL6B0bsZR
         W5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=z21SmdU0EHwfhe7yr9aHqk45/azTQkXurgKQFBCsMxE=;
        b=hYQH77uhAjZZuSRW1V3DcA+eLD1M21bjabyqslmBpXQZqx3gqGUcxb3Gapp8yAPtRU
         b1xJ/uotK9zN8OFCpVL7SHjnaM/p0aPrZitvQvqt04m6YI0q/z/W16huweD2Ac/FguHY
         WnFuTTmZqhVpRY1jgpci+clZ2PDdbeUk/FPszGJHKgywRfWOYWx1xY5lMxdAkw+Zm8rg
         iDyYuw27TZNawks86lW5+y2j+mzUQkSSdDzyomQvhpZM+ZY9Rwuo7sPo+5xoSbk5qAS9
         petz+exutGOq+qICGkTNL6Q8gKjoIkBN1+9jEygO+YjD7hHEz62fmqCppoBbaSEl6SBf
         eVVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id mm4si572455pjb.2.2021.06.04.08.00.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 08:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 154F0rXW007879
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jun 2021 17:00:53 +0200
Received: from [167.87.78.199] ([167.87.78.199])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 154F0qDT013054;
	Fri, 4 Jun 2021 17:00:53 +0200
Subject: Re: How to partition PCI devices to none-root cells in rpi4b?
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
 <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
 <aa1b60e5-a823-4cb5-b36f-d0162bf0583en@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <db85b6dc-4d10-3e91-cf4b-4ea6d8e44b2d@siemens.com>
Date: Fri, 4 Jun 2021 17:00:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <aa1b60e5-a823-4cb5-b36f-d0162bf0583en@googlegroups.com>
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

On 03.06.21 12:02, along li wrote:
> So=C2=A0this=C2=A0means:=C2=A0 jailhouse=C2=A0 cann't=C2=A0 partition=C2=
=A0 a=C2=A0 PCI device=C2=A0 into=C2=A0
> inmate=C2=A0 on=C2=A0 raspberry 4 board=C2=A0 for now?
> If we want to partition=C2=A0 a PCI device=C2=A0 into=C2=A0 inmate,=C2=A0=
 we should=C2=A0 modify
> the source code.=C2=A0 Is this right?
>=20

Jailhouse partitions at a low abstraction level. It can split what the
hardware permits to split. On a common ARM SoC, those are generally
platform devices - which can include complete PCI host controllers with
all devices behind it.

PCI buses can be split as well, provided the hardware is able to tell
PCI devices apart when DMA requests come in - or you have no IOMMU
anyway and, thus, cannot completely isolate devices in the first place
(like on the RPi4).

So, assuming you are not looking for secure isolation and a fine with
best-effort, the next challenge with PCI partitioning is managing the
host controller. We successfully partitioned in the past devices on the
Seattle AMD SoC which contained a generic-type PCI controller. I didn't
study the broadcom PCIe controller interface yet, but I bet a bit of
adjustment will be needed, primarily around intercepting, interpreting
and executing PCI config accesses and managing MSIs programmed by the guest=
.

If you are looking for secure isolation, choose a SoC with IOMMU (SMMU)
support.

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
jailhouse-dev/db85b6dc-4d10-3e91-cf4b-4ea6d8e44b2d%40siemens.com.
