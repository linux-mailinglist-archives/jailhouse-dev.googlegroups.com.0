Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBC7RXPYQKGQEP2BVGPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C414A684
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 15:49:48 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id j21sf879197lji.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 06:49:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580136588; cv=pass;
        d=google.com; s=arc-20160816;
        b=hp1CO+eZj9TCHWokRuW3YLv3tvFXReUzO3FIIFsI2IugZcj/LIihfphHPufBZT0fT+
         kvK6a3eKTWLjKQ68Q57POt9CIznfH+EKZ7AfJOyQ1FwgiJMBhj3+E2LrwvdO2UvkGM6A
         AZ7YZBGXYTkN6G6b+/pLUviHoVANM9/GkY8iil5UAHSuTwPPoZREfyaPP2JqRnSlob/e
         SwSAZU/erZqH9xmZuT2M8tFcI67x445pyxQoyPN/BjJDPT3eaXvhM8gDmP5U4LtRzPJz
         jmNGGDxYLOzUrFnIbsapx7I0+7sr50Cukp7itor95KsQc7ynlDy//jFF2qRN90WG8cYC
         skmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Bvqp9afKgPgv1gd/9XiCdjAJoAaFxRlmUOIpf0zUCV0=;
        b=OiImLnVU9lg/DQ8uBsr3J9mfu0+cTpuvgX2z/g2snFm4TtlhrdIkETcC8B/uWx8X4V
         Gg3UYfXWiJ+mvnsY6jORoNBdVYyHYBP+3StR+ZJFCSBgRkQiEVg/HSUtMbni6vhTyYEu
         sC5jkHoe6e1grxqb1TIKuvXbfk78yjE+Bm9S3VssFPfSLVq/qs5eBHF/gRG7jt8dyMnL
         v0PKtjlVQRBe6WhSSbWSRTHRQeY97I95N+oSqn5G50Q+yzoNlPhjBw19aSiUcG3A9KzS
         NCZjLPAJkq4OIfmlI+P4/ZY4EfjYGtbXMllE0wcPvRCOQbo1cNlg0dvOPp8cK71jVBkx
         kjQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=db3UvazY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Bvqp9afKgPgv1gd/9XiCdjAJoAaFxRlmUOIpf0zUCV0=;
        b=eeuaQbDULMM+OncqtCvzniwv5xSj0JvNk5FqZVvoHq5tDNALjTYmqKnboO45JdC02u
         EsVnxum/LG2iQ1i69244NEiFNlmOcE2m4gItemQhbEo6FIQ1E+OoN2pA+gbU36HXGODh
         /ohCHq1N0RtQm92I0Fg/reOQ+MJhvKzmzDrRRrquZsNnGGFy6LUYCuHK9qoiBIBj0VmI
         RVJoWlbtMbrv9NqQpE/Pz9vnV2F/YlXypLfXMbnhZJijPyoRjc0dS9VsSMUuouPByTQ3
         6HxLQPD61bOhnqWFLqibeQjnH2aOh73IRO5wS/hzFabjYfyG5bZk5adXCIDzfmWzX/KJ
         wh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Bvqp9afKgPgv1gd/9XiCdjAJoAaFxRlmUOIpf0zUCV0=;
        b=IBvJS2YDYAJ5oTyirEa8zH0BPKUgPYJ+gGTM8zjAfs1F3Rb64kAYDTIlV7377vmjSy
         GahgCdopo18NJvMTaz9b0Rb9b0j7dNMAqlzxQ7FQWtLBS5lMD2N7OmLmy04oKYoDwa81
         OWbnpIKs3YWpUykOcs2FkokyGJC9kSWIPHSjUBNIvMR3bHHnRq5D2yJeS6plu4mcEB2n
         Spmun/7ag9mqdCrDdk+7XKID033a+mU+DN4GZpZHPw601Tk0kHqiRovcyoiOV4yY04EA
         AYUntleitbZWgOPZ/4HBZzYvoHEFbD8GudDEqP27Im1U3qtRI4bgevqmV51LXqKKaq1J
         5PfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUGVmkwU44VEjfPuzpUOYrG+Ma8/BIrzK+BHtu+NTU9NwMtomnX
	X5JPWFYC3V3o5NlbvmOB8/E=
X-Google-Smtp-Source: APXvYqxzk12W+3IrTbPDbb7RSrOtAghe9dETbwBWM/xUrbCCoVPehRUgXh0AbaGLjupIgX/dfkJFPw==
X-Received: by 2002:a19:8b89:: with SMTP id n131mr8224710lfd.14.1580136588126;
        Mon, 27 Jan 2020 06:49:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b4e7:: with SMTP id s7ls1823071ljm.10.gmail; Mon, 27 Jan
 2020 06:49:47 -0800 (PST)
X-Received: by 2002:a2e:580c:: with SMTP id m12mr10581777ljb.150.1580136587402;
        Mon, 27 Jan 2020 06:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580136587; cv=none;
        d=google.com; s=arc-20160816;
        b=ZE0F6KfEhlaQtS03HRq0j9TKO//INtAdYPfb6xG7Vzgn6aTMR3FbzYKiEZTm3Koa1K
         a+DzAUrPHxsPgJLjvOFHDYBWsYtIjVF/4ovyagxl9yzqxx9oXOrmr4ifPF8QHND74xSR
         8a40EviUOYZ+KVvsQ7EInzF/O1EB2fKC9LiF8+13O1TNgTy9WesTt51zDrR7aACXGQV4
         L4zD9WGiC4g6B8UDI2m14cp74EkG7A2TJKys03A5t7/sj0aZKpCgRLpyMpfziZHXS8MO
         1wdaErWVmizYNuKX6zaO0fLenV0llc4AWlPONfbXf42oSYKVX+6acQMV9APsT6u2NTOj
         SrRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=uNpyxSsSSnd1b5hdAVTMukKkXBEM+dXQaBxZFEFlK44=;
        b=L2/6v7UR8JXY4JXz81aXvqO/6oON/awuzkt+//+UmHQbbpq+o9i9zidVRwY0fVQgbc
         9FTfybc8fz3zDtJqFwnWlhXZsMQi2K9azYMYabxYTIzFge4Ksjj08Qrtm/lx4DrIjzfp
         /+W2+SnHt0W0hu8p4wLQ3muBpyKfL4WNax3tbdEuF0qN11Vl9d6CSwxU9mTQartGfhFz
         DdWYu6gWVZIrr8ND4457IcuKDdMXkbnNTb8WU1/xBQ5HCH/1a0H7FuT+9KCDEtAI8Jkp
         AgRxaIobx2jzHob4PHZqDjtIrKX3YYowpiOY4hsku1awtGjy9Ho4PnLQI75S2zQd5i32
         B1tQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=db3UvazY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id a4si459206lfg.1.2020.01.27.06.49.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 06:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M1G68-1jkTMw21O4-00tA9f; Mon, 27
 Jan 2020 15:49:46 +0100
Subject: Re: [RFC PATCH v1 0/4] Add support for partitioning registers
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <e4e85734-bcc5-d833-3f31-53e90c186de3@web.de>
Date: Mon, 27 Jan 2020 15:49:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127135611.21302-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:yQomiIlrzAQrNtK53iCKHA7jz/M5Z+vBNAiiy5BZB2gzl9RM2Qw
 1Dt7mQOkLri4NHG/zU9qgrO7KVi8SF8OGXfUDB1k1UyLGdaMsx9fGZjNqPpzoCgfz8T6GP+
 b9Xo00GCePojW0FvedXlxPq6ZRRtDCay0AoKpkdCtcIZJk/Cv0QrwZMPPChqK1FwNTtsYW0
 0EfwchE4SEkFKqaa7NDMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L3A/NyKO2qk=:gkad9yX3fxi86KTe50xMez
 Mji42r8rayZFzsj79ABJ9bfHnm/tesJrSMnLnWUe/lwVYL1ptkL/krw2nZmzSTOqWc4q/Q54l
 rfi4w9mMlsiFrTrX4pzBHvt3PheY7MR9O5GLlazhxL/e/mwXH0flSM7p/Ov9gAVP6BSjAv67z
 0EVaL8BzAZDp9zL82aTV9JnG2geojq6ObpyqosMOzqhfk1bfsk+fwgSARc6DFl9ZkBGaqXKQU
 yY+C3ONe7+khTDawrmBV09r6K2FT4dxjzx0LWLWfFkYQFHimMp3F8bo6U9WPLsKL/iKlFytyK
 2IAo/dWDWwmVSHCWmxvxEqSVqgOpj9Y8FHw+GF5zGa16HZud6ice7VlZ3yxuh4eBcjn4aFJaa
 nDuzG8Zq6Oh8DYz5MAFOpCsnuxxBEYw8MhDc+5UoXJFd2in2m9XbFOv07LNdyLqwQlAVv6JAn
 5WyACIQTOwMqXOExg1TTvn0f2lS+FmcqkVWGdxWyriSV1khuJI+fG9muL/Es4yd122br395G6
 TJknQF7yVxXBQMctNYPpKjCnrLuOUP/52cAQFpoe0CMOm5hjdF9KhdQaXIJJiCSiFZxOeJGiC
 uih8MaWKsP22tPVl6rtP00SAFvi5ss4ENR+vvhnxcWBJhrGACuc+wCDoJQ+BkzczN+rUJmPOO
 cLCt4iXYrm3oKrtHnieAPsp0xzaIbeREFrsaToA3GJkwcVywd50IgP7gYEpUxdcQLJKNwyMBI
 zDRBfRIk44uDI99/eHdXAM+VUKNINlCJrJi5F9Ms9yKthfC2EKiA7Ua7/dL5BMld65H8yvkCE
 B0whiWLNQv5Y051Rp0GonIlfm85CM1ARCkPEGzeOwS3Kjz9wo1EsD/tO4GxSH9cG+z9AHLERh
 Gq9pw8MC71OEOreJetfPuNFcnwI5LHOOl6PZSzZ9gx0rthVSOFedvRUtR4NY31A/WGxGWJL2q
 5GY432WUycaaY529KZyKSoOZFeLfkH4lx5j0TDMrsz7gihcRFaNtPVtQ2q6enJKXBFyouGZ7i
 kvR/z/ThwainooqXRCxKDMfIvIDBmkF8KB11T8UCyXkwd+q/Jm2B7ZAodS8tyGyqoe1P7uNVE
 BysJgdy+5CGaqqdILPo3DiLtM6jwy3zvDNm20WRHtNLjEkbYbSCQM51eJngNMtcBzLPptWab6
 Z++/1N332yAFBl0by+k6It5s0Mm0S6wRnqZPuBcH5C9agjw7L0M6phoXWKsz28h9ROR3NWOtV
 C3q99ISRBG5sKVtF+
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=db3UvazY;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 27.01.20 14:56, nikhil.nd via Jailhouse wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> This series adds support for partitioning registers across different cells
> in the Jailhouse. Jailhouse supports partitioning memory regions; where it uses
> MMU mapping for page aligned regions and subpage handler for non aligned regions.
>
> However, most of the embedded platforms will have common set of registers which
> need to be partitioned at the granularity of single register. One such example is
> the pinmux registers avaialble in many platforms including K3 J721e.
>
> This series implements a regmap unit which allows to describe the ownerhip of the
> registers using a simple bitmap. This scales well when you have to partition
> hundreds of control module or pinmux registers.
>
> Nikhil Devshatwar (4):
>    configs: arm64: k3-j721e-linux: Add USB mem_regions
>    core: Introduce regmaps in cell config for partitioning registers
>    core: Implement regmap unit for partitioning registers
>    configs: k3-j721e: Add regmaps for PADCONFIG registers
>
>   configs/arm64/k3-j721e-evm-linux-demo.c |  41 +++-
>   configs/arm64/k3-j721e-evm.c            |  15 ++
>   hypervisor/Makefile                     |   2 +-
>   hypervisor/include/jailhouse/cell.h     |   2 +
>   hypervisor/include/jailhouse/regmap.h   |  47 +++++
>   hypervisor/regmap.c                     | 258 ++++++++++++++++++++++++
>   include/jailhouse/cell-config.h         |  22 +-
>   tools/jailhouse-cell-linux              |   5 +-
>   tools/jailhouse-hardware-check          |   2 +-
>   9 files changed, 387 insertions(+), 7 deletions(-)
>   create mode 100644 hypervisor/include/jailhouse/regmap.h
>   create mode 100644 hypervisor/regmap.c
>

Worthwhile to discuss, indeed. The key question for me is how well it
could map on other SoCs. Ralf, do you think it could be that simple,
based on your experiments? Or could we also face scenarios where we
would have to dispatch bits of a registers? We already do in some GIC
regs, clock gates may be another case.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e4e85734-bcc5-d833-3f31-53e90c186de3%40web.de.
