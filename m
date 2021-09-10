Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHPH5SEQMGQEEV7EYMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A24406A26
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Sep 2021 12:29:50 +0200 (CEST)
Received: by mail-ej1-x640.google.com with SMTP id k23-20020a170906055700b005e8a5cb6925sf825300eja.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Sep 2021 03:29:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631269790; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZetypbpumuRsVnXerbv9DLwxiz+gToU4EE4mfauyAgQARku9/QfBI9YBQy5tMQwYD4
         2keLPrdWstzMj7nJBXN3sFFRRfzAm0hlvkEQES3xi8zFDzotgERnO8KPEah8gL2mlSBi
         YcqpnfyUCqyNV+B6A5FJWHTgrS9xWJwG4csK+VSDV3u+2ltbLtCx28Q8Ol0O0Ordhbmv
         w9MPRTC1Wa0cWNV/1gBULQZTDBr47WTa5qpXOe6WoJDzqWDF6alQKSw3YPgpM0mIPZSU
         CltnC4VPbv3Jn/RKUWIsIdSV0W4d6aAuNWx48n3WkA7qiS5mn4CCb+aQRQmf0iSs3Ybg
         jCbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ULuuaIKeKM3Zx+487UvDVk4IzqUeQxfQpDYnFbwurrU=;
        b=hA9GshjIrTWhv7kPE8q4jjmWT/iO2bqU9juiqtEiujtwwj4kvDie7AR498lnEgwt5z
         ABIBUL5YzW6KLdPZWpANpI6Ledpp8PmI4nFC8c+mDU8EFSz4CnaC60Bj0pQ7n1b9265+
         8rNdr+ULD3ZZyd4ndRnGv2aU2Er+vNtlsANPMJkg1E3BvKtbM7fGJAiYf1Gk5pqdwxfp
         nL7kbszxI67GsG18DlmKfhtJ76IMOugA116ada05isS2L/OOeUMN6WgDUzWwOBuV4iKu
         bIO6w1jB3sgucH5L54zYxbIDFMm9g6STBSpji+uq6wZ93FflEYg02f+rPtCmLnahoA9t
         L9dg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ULuuaIKeKM3Zx+487UvDVk4IzqUeQxfQpDYnFbwurrU=;
        b=YLOHBkUltWScvCGHl5zvetGCnOKRF/Y2sJyBoeqCWSPR28QQ9yhncQzoSTs4Vu6Y56
         4CcV/8QXQigEFjaV0bf3Ue1y9928qzA1go5KzcPavOH5THNLPEwJyhvrgOWnjTljxO4E
         poQijd9A1pfh2oqYlnG41i4rQfuRVRYHYrxjpaSID1O0HUcUWfe81EzFgL+DNNCVbbiA
         zV5O6gv9DcI+P580VvHYkazjshtym9YNpEM4XKCkzX7391w0qFy3TWZiE7sH1tm7be3W
         BUzwgF7weAjq5PdjTne80LMeMxrvX69lTOYxDVA05zH4L1L2sm0711g1oBplFXHZflBp
         fqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ULuuaIKeKM3Zx+487UvDVk4IzqUeQxfQpDYnFbwurrU=;
        b=u7klX/c3O0EWFvfxw6ORjR/c/yKNL/bI0FRGvMgggoQZJ10CTtCnS3d1R+CGS21Jfj
         xFjMevxSadkpyEviRiM2M64Xh5xC6buedcJTXEJjr6YQYvHoxAW1HQSmA5hqFzqyS3Uh
         hjreGnNbZvRmmG1XVcNEn10xvIRA7Oj+MGKW029eqd1jdjAzzSLvvLe+sE+VhqTTg4NH
         hSxvXr07EqEL3QHd1BbBX6AFHGg95HxPnnot6XkB+RbJDDJhYQbsCVpdC8jjSSai1Suo
         ZeJ57eYgc1+PTd/bkOAJTSHmrGnjaNBugH5yNqjXtulwYNuY9W25ubNO2afXASrb8m9L
         vuLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531BUDFq+WmQR3WMBulu1hMZiCesqVBd0Rn10DutXl+qGxfi3RH7
	bx2cQhO3LENVJW8tGcImYVw=
X-Google-Smtp-Source: ABdhPJzmDiZCGVzQa/NC4KSixe5LlSiEVfogiP23xm7COHO0arAfrRWM81JLmnURK3bJ9x9ru9LRGQ==
X-Received: by 2002:a17:906:850a:: with SMTP id i10mr8794613ejx.256.1631269790053;
        Fri, 10 Sep 2021 03:29:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5e47:: with SMTP id b7ls60441eju.4.gmail; Fri, 10
 Sep 2021 03:29:48 -0700 (PDT)
X-Received: by 2002:a17:906:6a21:: with SMTP id qw33mr6727227ejc.326.1631269788866;
        Fri, 10 Sep 2021 03:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631269788; cv=none;
        d=google.com; s=arc-20160816;
        b=TtN2jKl1gKQNzE/15QwXDzZ7pF/z/t54ypuYpRaUesxJGrlrNZ1XYIBKMEAE/ylpa2
         P42OIXMOgE+oLJLz/qtc5ka5jUnQ49REisdk39p2j7AUOpK8/NZXwQYHcTdATCBLjNHz
         XkAhntRn3yoT7zz7NA3DrDb254m0Lx7q95R6Ublqa5LT4NHCqh+IFsXBdoqSI+iJn0Zh
         f6zkBpgriBo4V9bYgBIwECShIymNsmf3vIFpdzLrmBk4KOY76Jw61ez5cJTDgvueLxDf
         UVuR0V2tNsobu3SqOoEMeIqaRyc1h8d6inGCAv9a278uR9zEBCI+cGouUTWUl+E3NYyh
         NKCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+LZToqdzr+HOaAix9O6XC2+W/1kuNAy+nkdldcnbhLk=;
        b=txIuwYQFW8LG9UZo+rIcP/QsXOJaLapryc8ZNFhowV4FOnIhoNW9S5n0B+goT0Ou2E
         2/8QdbbOXfNDhT92p543T7wBKS63eSRcuznDPv3N/Xg8o27d9iuk+eBp/jeP5IaOQ1gq
         6MYukB4zjMHzY+t4tRQbkGqxn+uyGSfIvcrL7Aue+OAVx5oAjsoqn3GiLK/cDE73sUMC
         Fj5E7QvvNq5LHFdOn0EyVft6MH6zUeIJPqQKx1ykofxbzJupRTcBux3sB2cJjJ5lIfg5
         dS3G/GKP5Gt/qzCwi5tjAKr+7sAwmyXft8TZlJqeAkY82b+3PtWRCPrQ7lwqLs4p3pXS
         t7eQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id s18si367524ejo.1.2021.09.10.03.29.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Sep 2021 03:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 18AATmAM006393
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Sep 2021 12:29:48 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 18AATlo3015465;
	Fri, 10 Sep 2021 12:29:47 +0200
Subject: Re: why not unmap the address after paging_create()
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <CABSBigSdOnywGHkoVUkN599HZOu8g7XYiRLo=_QVRbr1XsqL_g@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <184b52e1-2ebe-6b4d-39e4-d7861f3001cc@siemens.com>
Date: Fri, 10 Sep 2021 12:29:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CABSBigSdOnywGHkoVUkN599HZOu8g7XYiRLo=_QVRbr1XsqL_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 07.09.21 15:39, Dongjiu Geng wrote:
> Hi,
>        sorry to disturb you,  I have a question to consult  with you,
> why does Jailhouse not call paging_destroy() to unmap the address when
> it finishes accessing the physical address?  as shown in [1] that
> handing mmio subpage access.
> I think it is better to unmap the address after finishing MMIO access.
> 
> [1]:
> static enum mmio_result mmio_handle_subpage(void *arg, struct mmio_access *mmio)
> {
>        ........
>         err = paging_create(&this_cpu_data()->pg_structs, page_phys, PAGE_SIZE,
>                             TEMPORARY_MAPPING_BASE,
>                             PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
>                             PAGING_NON_COHERENT | PAGING_NO_HUGE);
>         if (err)
>                 goto invalid_access;
>         ....................
>         return MMIO_HANDLED;
> 
> invalid_access:
>         panic_printk("FATAL: Invalid MMIO %s, address: %lx, size: %x\n",
>                      mmio->is_write ? "write" : "read",
>                      (unsigned long)mem->phys_start + mmio->address,
>                      mmio->size);
>         return MMIO_ERROR;
> }
> 

We never unmap those CPU-local temporary mappings, we only overwrite
them as needed. Theoretically, we could invalidate the mapping after
use, but that would also require related TLB invalidation and would add
to the overhead. Without a significant gain on robustness, this step is
not really desirable. It's always a trade-off...

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/184b52e1-2ebe-6b4d-39e4-d7861f3001cc%40siemens.com.
