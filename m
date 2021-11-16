Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHVGZWGAMGQEWQHQGUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc38.google.com (mail-oo1-xc38.google.com [IPv6:2607:f8b0:4864:20::c38])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D7452B28
	for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Nov 2021 07:43:43 +0100 (CET)
Received: by mail-oo1-xc38.google.com with SMTP id y9-20020a4a2d09000000b002c600da5eb9sf316914ooy.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Nov 2021 22:43:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637045022; cv=pass;
        d=google.com; s=arc-20160816;
        b=L1bsfMP3wE4ufJ4F8QLg5RNV83V/Sud65IJbynplD6Yko6LWMFhmKt7RgN8a/hLDpK
         bBNnqddxmQrUtSU7bIyCqT8eqA8om+HojAScLRo6ovHQul8nnASLS4A+UUZ8cQLCpFHq
         8n2udlr++Wopfq1+/0zRUCQAyxHezytbLpNLgbcNGR9pSkSRRmxWgBc7Q/EWq/81e67B
         JfKR88k9E/ioq0lRWHaucPjbTRaUU+zxzGjuaocM3MrAq6qW9Uu33oumR+Qz3h3bzF7S
         va9LFw+5AO8GhNS+vbkG64Df/lRREFnFPrfkqg6j/rFORFsva5WQZnr+L6Iu/tI8yD0n
         A7Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=FvTB4Kg6nwGGjIsxsuT1ttNxcWWi1of9ixTVqSkWNCs=;
        b=nX2s+5Tu/0VEKTAk77hfEkYrZowzKrBN47ni9LEqO5Hg0pxZOMjkflYIWQweEggHlg
         RHs2sWPZlcEGQKenyEw6hDV4Lj4U4V3Pusr5Ya85fJBNnMQNqY+YJCZ1JKD0YtZbPzpm
         aStwUdT/T6RIdbcIlKrFP+BHo8hm0zUN6zUQ9AOnl52MOttI1rdSMrzKRTuKRQ14fcsi
         di9tReOWmJiN0eEsi6IDwsp4KccNKQvzxO3G8iw7wXS6eohjGHklJ7wLb8S7mdPqTINv
         oxYzeqxq9uzfxFObRNxOvoVz/ykLyBRpknWn5QZghrYPY3bX6VcNTlW+XUBMcs82+/s2
         ch0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FvTB4Kg6nwGGjIsxsuT1ttNxcWWi1of9ixTVqSkWNCs=;
        b=C/tqM1XHZayjZXo8D1RI/pvQKcFBewUMrVLkMsDKBOdV9ah0a4cIsaYHqD09X7GLmV
         QKTF+Vt36sgZ6+EJhsgZGSSBm0+yqb+mjFXt4qHDFtaUFgz2P96PUeNX1U+jtpr4VqDN
         WvrWfKlOQ/mIcKpR7BE/rY5/K7qVz6x+CO9aDBoao2jezGUuESE1f/Jt66hWmkmzf8Eh
         cktXlSYL9fQhdFFYTuVnEW07x1p3anzjYvowIdeNvXsszt9mDLfyDWAid06nvu6wpJty
         blKow5ruIKVULSlHRmcs5OzFxVcj8mbZ0oDefPmm52Podp+t+PTlKW2PnDaeWTCQR0c6
         Ramw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FvTB4Kg6nwGGjIsxsuT1ttNxcWWi1of9ixTVqSkWNCs=;
        b=AIGAOBAjCPiDO1+KRP/ZRUXMFKCeEW+cinvcBuvaILd5qCBXVC5QxMK+njXzV8IM33
         Pd/lWS8OfPe7cAj90X4j0pcVmGwKW2da5VtWfprMEpNxfQ5VYkZdwjJV27L1pKh9/uRE
         EhnQNWjjfzu9/8X+zb8o8lV+MpiuTQWOB+PjoofVT/vFdQgksI/Ka3IekRZlZTZmfG90
         U7sYmRvrcQXZphjlVSIKcyhqCqRDaOUM5OD5DWzW31Rr12s/Zxr3PrsVwINBXgSlS1x2
         jJ6pXiweBZjfrjJ/ItYvsDgHMw5207rQ1Xmbmh3+wPm7ivzLekLF1b1HQgzlo7f0CAnG
         +5iQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530l2KZSFuRbNCF9k6qgj95VqBMZykFAbc/JhW4rp9+YHqxBR/uQ
	6fjI5DCdrO8ro8pjQgp7nRM=
X-Google-Smtp-Source: ABdhPJxZUJENOji2CfxWikApHWgTQzgMnWUnrqNE4CbfhzNxuNj2C8pFGFA8WyCXwr23yYEr8xk3jA==
X-Received: by 2002:a9d:4d8c:: with SMTP id u12mr4273922otk.334.1637045022213;
        Mon, 15 Nov 2021 22:43:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:19a5:: with SMTP id bj37ls2191960oib.0.gmail; Mon,
 15 Nov 2021 22:43:41 -0800 (PST)
X-Received: by 2002:a05:6808:22a6:: with SMTP id bo38mr13131326oib.78.1637045021715;
        Mon, 15 Nov 2021 22:43:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637045021; cv=none;
        d=google.com; s=arc-20160816;
        b=pDP2RuoNzqi2vjYHU3nTna9paaK9D9c9m6e0LmTXGSyp/ez7ijXF3FKKch7GV699Rl
         QffIgqYNHNwVgCYxk4s3EKIOS2pkWPFqVJ4+Ddev1DQxiy5IHJb8Uy+5oHz6JmABBcWP
         xYVhQvldA0a804mju/meYxf1h03bMg4XqpIrsCc3pMXC/WgOAnRlQfc0XSNmBXWpmOiZ
         hnv2SgC7Q7t2uZFzMKDXKzXTSeqBSL9vqFuSnudUdU4DNULF5vB9WQotAx5UFMS4oj80
         ip7V0V2PGvhDuiDYRdZv3KB+W9np2ULQVyGsr03u0cct2GMlI6E9p0WyqJo9n+Y5kXeH
         WTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=NkuGp9VlUF/iH56VLSVOOoVgTHkyX0J9l3XKQ9Urk44=;
        b=HpXEbysBOKXQ6HXtpSKOoOdARBDnbg7cmqFI1sd3BYkf/VDx56xrmyqSYkqJSlXxxh
         syJiywG60sKVs9oBoLgW8WD4nnHCz1GkHtaS2QEX1XvaKbMiO0ThHL8IpUHhhYU7z9/I
         zZ4e2bSMPchNKQF8X1r7Re9wYhNvt8gNf5nEYlOjWYAS1Uj1l+XX5Z+WDMXOdRZ6bJzG
         3NFJo4S9z64ANADy8CMcFnIW8gbNlfx7yinGq8QeRWsZsWCfWScjG2cCqmmwlxmU13zv
         X1xru4Gs+CywYyWrJ1BR1KXmNUQ3D2OvjyaF7C9ZvuMaaOy/2Z/PsoUJwM33YfbkTIDX
         SCeA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id u27si1609379ots.2.2021.11.15.22.43.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Nov 2021 22:43:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AG6hc3p030286
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Nov 2021 07:43:38 +0100
Received: from [167.87.0.79] ([167.87.0.79])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AG6hb6c010223;
	Tue, 16 Nov 2021 07:43:38 +0100
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
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
 <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
 <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
 <69d8e666-daf5-4146-b96e-8a6578ec2cf6n@googlegroups.com>
 <597c86a9-bba0-43af-bc14-629d483c0bden@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e1ae4c0a-f3c4-5dd2-fd13-cffa2bd9b3a5@siemens.com>
Date: Tue, 16 Nov 2021 07:43:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <597c86a9-bba0-43af-bc14-629d483c0bden@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 15.11.21 10:19, Moustafa Nofal wrote:
> I read an information that CONFIG_PCI_HOST_GENERIC is available from 5.8
> Kernel. I think this would be the reason, why jailhouse fails to add
> virtual PCI devices in 5.4 kernel. I switched back to jailhouse image,

We had this running with previous stable jailhouse-enabling/5.4 as well.

> and will try to build on it as you said. But one more question,
> Why are they missed from 5.10 kernel? is there anything in configuration
> missing?
> __get_vm_area_caller
> =C2=A0ioremap_page_range
> =C2=A0__hyp_stub_vectors

Upstream decided to drop these functions/export, for various reasons. We
may overcome those eventually, by dropping armv7 support and by
reworking the hypervisor boot method.

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
jailhouse-dev/e1ae4c0a-f3c4-5dd2-fd13-cffa2bd9b3a5%40siemens.com.
