Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBH4HT7UAKGQE5TH5QJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D9248933
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 18:45:19 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id p13sf4875008wru.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 09:45:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560789919; cv=pass;
        d=google.com; s=arc-20160816;
        b=nDWcjGe2BYsiWEejC0Rbw2rCYbgUuy1s4X5GnUi2Ul6Os7j6LG9X0MzmhC/pBVC4H5
         U79AeVmRSd8MKLfsG7ubukT8StH91e4aA8/BaKBy+3YyLSmIRqNXccOuHtybE1xBfM/K
         urnbllHdSSrBSvScq/lvviMeuAlVLludCX3MOhcate9R7Zfk4O0+Lkc8LC3nAlt20AzR
         V4LsOm59EewICXtF9f84ckoMuJOASiEchwrUodTCCN2jrAH4px9qQlCww4qUTqp8Nu9o
         j8vvWx3F2KRTlOS2bmwMbaNd4DPs4nLjm5i9P9hynJCnT9UYRbsLAbauaoUlPIFphwmT
         nOEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ekTj2XAICHqcKgqptaqa28un8RbAqya/bGXeMI3TwhA=;
        b=BD6RQ45VmZvXnsXpwJeOqkQQTDqfylnkfda5V+Fi0/aguMdv8ijv4ChQfw/EG9mWpB
         aPczkdJjELk70y1kQE/g4CgrnUXv0mIhflvMj+vPsHCiduJl74PhD8fNBiwJfWCP3OYo
         z7sUT4DHB0H9+htR/HDX3Y1HLqB9vRnumToAdai+kqINsq5lQ291tz+8iAzsHZCLarWB
         cwIHKlqrWy2XS5Q/6kFYEGLaB95xmqTYITSqpjrasqrYo6wc5hJODnPIjQ9IE1Y3VqhS
         4gchd8w9zixXB+ZQk6GsB9xbjzjGNdCCZUjvh7LuE/elHiaMfBw184N077RRQKvivjHQ
         l5aA==
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
        bh=ekTj2XAICHqcKgqptaqa28un8RbAqya/bGXeMI3TwhA=;
        b=V6Fq8jlt4rHjgI462rrGw3pLuwNqgE5GZ+UbX90TTONlr4MydnqohVEBu34Jel7bOQ
         RBP1kmd2cPM5m5cjRHpNm4j9hm/3euyuQDVRh+gApf6Yq2mfGCUNubhtUzUn0WH5SPTp
         UrxHJTeMxov+peKVzYyXqyI8+NzgANCUek9cwwutD/Kp25I9Ldmn7oWxl51vtNQoIw1Q
         oawb3Px6WqLiF4Jak15noslBnuO6l1DSzBg7hRJdhnGF5aNWIs8nkidX8Djei8CZ0GaR
         wwEsd8/XVnfVfPdggCEFlX9hO2DeiaaGULSvop+ERPyanpHO8RZ/7RnDVLVHnO4VKEdz
         XTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ekTj2XAICHqcKgqptaqa28un8RbAqya/bGXeMI3TwhA=;
        b=ILTk3ssIaT722+aV3kPaXvFnDZlep8XE/DyHcdpQQoF0VzuR/Q2DlW8ERJ7ivgbpCk
         CK6SXaTbBJn0ANQ4QdlvaDYwPvJypdJtVYexxnOh/ablFc+57HF8MIhLpaNN/52BKK9j
         7UYGppCVDr2oONbkaCTcTHps5ij/iPiyw6LmJMT/b664RgDZx2pUi+JTRIzcEHBF0P5n
         OE7LsAfvhetanCWYNqQu26BQ4fX4+p+pxfPFsZ96OoO5dD0Qgad8y1AUB5WlbsorhgKr
         1JRttzLI4M7vTrbi9pBOq4d413REhSt3BeDLqagPojKDef52uQB4ptchzF/MNWMAtNci
         TTgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVykXA2LmsCYdDnKNSy58ngFSeljp9zzDkpFtjEYk3iJRBmXMYh
	Hp18vnbhpsBsKnvr0YJrM24=
X-Google-Smtp-Source: APXvYqwgklWWk8sjhqwxIutXZGVtn0vWLFVZjiVzIfe6CcwH7j7WzVZulZu8zMimm0zVWyu9RnhEUQ==
X-Received: by 2002:adf:f30b:: with SMTP id i11mr15329196wro.299.1560789919332;
        Mon, 17 Jun 2019 09:45:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9bcb:: with SMTP id e11ls1108372wrc.13.gmail; Mon, 17
 Jun 2019 09:45:18 -0700 (PDT)
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr25661971wrs.215.1560789918814;
        Mon, 17 Jun 2019 09:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560789918; cv=none;
        d=google.com; s=arc-20160816;
        b=MS3xjcedkZOl27KETwzq/Dp4IG/X/esl1D6LQPlaZKoPUwKxBRULnzZP/X/7fXkmQm
         ll949DNBB8qWEvmAJRlzZO58kqbGbL4kOohXkigYnDQRWA+5OzhGQHT2HdP4/9oO/EUg
         HfWf+waLi/HT14P7apphZUc2iwQhCGbl6aNeM2NjRL5wlTgxuog2PJsiAnPtBno1TwpZ
         ZWKeyXk2OjaasOFQodyaE24qBUkGbZSJTpqZohMShDSiKOl0pKoRnarFUo7EtDlS5Fgr
         1qeX0B+ASd/T0y4DS8Ydo+k59/AdURohwZgJR4a9zyoukRlqh0BqzJGvdezkgrkrj6Yc
         AzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=hqr5P1G/4Xo1lm27b1/1SCd3z1uavLRyo0XnzqU5NVQ=;
        b=O9TK3uS8aNJRJ2MU71kwb9RvKn9YV0m7PLqoU+0qn+syLlZCwIi2+LzYDea+N5fyEK
         e77qEVC08WipyhWmq6DU315LL20WBB9f+rYWeNzMDH+W1fo85XL5O09A9QosX2gUhGSA
         fhhaYfbtmj18gymBGqpAtkjU3iOVFZrzyVy2fnE1FtUfYgwkFLm9n4EfWnp5mKBOtGMv
         immLkqVeh9IPk3kQ4n3HssizZQ9nZ+RLw7sA6bAZWnA9njpkkKtLTLlYUWLWu5vdCV6+
         NxwMA0oKnsdkbPakyQCfQqprcBP+WOBekuPUgFM9+QmSq/9+dNivDUStBlsUVIsINu7Q
         xOMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 194si471176wma.1.2019.06.17.09.45.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 09:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5HGjIlp028895
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2019 18:45:18 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5HGjHxh001547;
	Mon, 17 Jun 2019 18:45:17 +0200
Subject: Re: Allocating coherent memory
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
References: <7b93d482-cce6-ffd4-291e-7e372f61cd89@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cfb2de66-e918-74bf-5de9-cbb3aca5571e@siemens.com>
Date: Mon, 17 Jun 2019 18:45:16 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <7b93d482-cce6-ffd4-291e-7e372f61cd89@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 17.06.19 16:27, 'Pratyush Yadav' via Jailhouse wrote:
> Hi,
>=20
> I am writing a driver for a device that accesses some in-memory data stru=
ctures. Right now I'm using page_alloc(&mem_pool, ...) to allocate those st=
ructures, but I suspect this memory is cacheable, and thus updates to the i=
n-memory structures won't necessarily be visible to the device.

I suspect you mean you write a driver inside Jailhouse, right? Why is that=
=20
driver needed in hypervisor space?

Yes, hypervisor memory, including that which comes from page_alloc, is mapp=
ed=20
cacheable. But why can't you evict the content from cache to RAM when that=
=20
device should see it? That's how we generally work.

>=20
> There is enum paging_coherent in hypervisor/include/jailhouse/paging.h th=
at is passed as an argument to paging_create() that does exactly what I wan=
t. But there doesn't seem to be any API/memory pool that allocates memory u=
sing this flag.

PAGING_COHERENT just means that we flush page table entries along the=20
construction because the table has been in use already and we will not perf=
orm a=20
full flush after all changes are applied. It says nothing about the caching=
=20
attributes of the mapped page(s).

>=20
> I tried allocating memory from the remap pool, and then remapped that mem=
ory to the same address but with PAGING_COHERENT instead. But that causes a=
n exception as soon as anything tries to access the memory.
>=20
> What is the recommended way to allocate coherent memory?
>=20

I suspect you mapped back the virtual address of the page, not the physical=
 one,=20
no? Still, haven the memory cached and flushing caches as needed still soun=
ds=20
like the better pattern to me.

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
jailhouse-dev/cfb2de66-e918-74bf-5de9-cbb3aca5571e%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
