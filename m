Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ7472AAMGQEBA76ROQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 32480312369
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 11:17:40 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id d7sf10421459wri.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 02:17:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612693060; cv=pass;
        d=google.com; s=arc-20160816;
        b=0beCqRwQuafgmaeO/SGxA8CjN37Rp63gNA5JmebxgqQ/paN0Fj/VfHW2IhSnq/OO51
         NivQnrRP6iBvNbVFGEFGXMXbczVJxzv8k3WC+LNvRdvpLJAJIqYrfB7SghfHQLspEsPP
         m7t3NlgE89ytrz74oNPD8wC1avrTXo/y3a468vZoQR1aw1vrw0uewoTRulIw4BY91xCY
         PXbWX7p0R3Irkj+/blK5VeY03O/yoawdjp5WFkGObnZsNnhHv/Ldl21OoXza3+kZBEzk
         q0TXyadjVkuJIrdkJq2qgIfZWuBd13I5BrcVx5XvIBkBsgR4UXwKU38URdojOUeBIP1W
         3BFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=hUCMuPG2wN+TtgMiyFq79jWbF3zryMnAZPEZH7qaE+I=;
        b=sA492ptOTgNQq02dViuoMnqtBNSrEkMlh132W2Mc7y+nBHz2QKsHGkcYImGW7HkGb7
         7lO2G3NBZOYADA5qdjgMLWgV7guCdELKuWBV7ATvcGoTBXbpajnyioaUy0OJAM84ndY2
         W/j8G+jUuwWkhS+A9Sg5lf0aSwPhsbhtEpz9LT0onZ27gs3Pck0bFhCn6t0sm/NHG3xD
         MuWbwA5WfxJ00zSrVxg/p6q8UzMgp1l4IdBULc0Jw0TKdfQI44pR/cLyqYSfu6wfHkda
         8KKxZ/nnE2fCnAnxNdpv2t0WR85UnRTZh0LYDGdNQkoacb+Abz9a8Ae9IjGAmk5tb9p+
         qh0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hUCMuPG2wN+TtgMiyFq79jWbF3zryMnAZPEZH7qaE+I=;
        b=XWMzLP8SJf8BwJJWpDhCbA+iOCVGtG92lnTa2GrqeBeFx/+bAZMIufX3cb1ECKw7wV
         WUXST8MdviT0ognt92/DR6oC1uolgBou21yeBCzC58ruLr6WHDBFJQYn5jDqOPTngUGo
         xwLPSH2pP/D0DdiXf1p2s+YAYKEgUzyqi1Nt/O6+SAzndjMiOrjX7/gKVu3V78HgRRjZ
         2GxmzDMnX52Jowd4fqPu+zQNE0u989+QMcq63JnfC8emc7lC5gEGWkKuyFAZsvwX1Brz
         jnJzFLVtHmmhiw3sA0LEVs+RgHVrn5MAQ3OOQ9O8OAbmMr7iQ+95dgdBbkQkCmQlygO2
         UaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hUCMuPG2wN+TtgMiyFq79jWbF3zryMnAZPEZH7qaE+I=;
        b=lYzV6ZouiQVfp9CWSpAM/rNSaDzFV14AqkpEra20xa1igPmDCvHARoYIckFS/9+OFd
         Ch+WTq7yW05DRKp6KXg1Hj5yWnpkgDpoVDctZRu6HSTisJ+gISVLHeAG6XRyj+3g2QzH
         WeHBHD4ibMc+AcPHQZTcKUMcQKdWe734YwNCn3UvzGA5sdPZQABohuwmYwtGf1qP0YsJ
         REiM5InlRA5ENKcDJXv9fqwYKjh0/Cjwg+xzamICXZimFwLnvJJf62/7e1QUmDvSQVhV
         6jMr3XMgrX6/LLmO/7ptmogCTRtVbOvuN3+dZjoGZeWrUwDfdokh+TwOPcJMnWhCaRRw
         W/0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531fuO6z9WXQw3+8QXSyqua3OGg3l4tqD82q7c6yxS3C6f8NTZGh
	74wVOlfLO6IFzmTnOvLitCk=
X-Google-Smtp-Source: ABdhPJzpwVsyUq1lVGlysvAziPGZv6I12KMOX3Uw79bSbO2+yMKhxciqD1yqeNGahulLsOBr+EENog==
X-Received: by 2002:adf:d085:: with SMTP id y5mr14602593wrh.41.1612693059924;
        Sun, 07 Feb 2021 02:17:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fd09:: with SMTP id e9ls391689wrr.0.gmail; Sun, 07 Feb
 2021 02:17:39 -0800 (PST)
X-Received: by 2002:a5d:52ce:: with SMTP id r14mr14360915wrv.71.1612693059059;
        Sun, 07 Feb 2021 02:17:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612693059; cv=none;
        d=google.com; s=arc-20160816;
        b=xlHlIsj9wqpa0mGi5l+IK2dCXVJQ+MHzjKeexCEpvGe2o04M/1ePEH52kZ8pdD19vQ
         yi4TvRuaws77Cg1Za5HQvQCW8nJ15CayrcUCjl83cabl1Fk4SNyCDcWi7cl/rtWqAvLh
         81eNml8Yy4Mi4rokt2F/tVy1FNpZMXIYQRu1Fv0QQ9Ua7lmVdOoo1t5BWPOocE5MsYYQ
         lSuxTjcuEqTmDO2ashJko35To6pv1JKNxmfQ/AjCdmGUjrCqcgmzjhMO/6CmXoFLm8LE
         4Hq1fzPzJfpv+WwQgks9GpgVRgBlxj0Iagl0RxW318Q+gumuaCNk5L6E0Bz+mPslRqQd
         H9hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=vdrz8wfzmQNjHuZ6DsQmm6id3fNb1t2DrKRBPuav8Ow=;
        b=CD1V1BfSKQIl6V9rfVilnThdWStxUrStrjyN+DY0RMTZ8N3juKMOYJKBHS3EepmgW6
         R5/NCSjKeisO9PjhNbmFt9CB/Miw55ep/3SeCZl2AOagatbIbmkQO9UgGTMoXiNTxPnX
         AzAMtlcvKVraqw+Rugc86gDqrtwpD7br01alCMjIpTB+Y4vBZV+0imvQU6Ol0PMG936U
         t5BX1zYV26jCSbmjOp5Ru8TNhi/OphCbFlnorAERmTt792LrmZuWdPm+fMbSzzi0ARba
         xyTzyRchFlHPZgqjg78TlM0FUBxR8kTb8pSnQMVUO9KqZVT7H59abqF+M/plD53bWX9R
         CaAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z16si54513wml.1.2021.02.07.02.17.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Feb 2021 02:17:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 117AHYgn021166
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Feb 2021 11:17:35 +0100
Received: from [139.22.33.193] ([139.22.33.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 117AHX8W015931;
	Sun, 7 Feb 2021 11:17:34 +0100
Subject: Re: [PATCH v1 00/23] Cache-coloring for Jailhouse
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8e7872cb-ea47-9c9d-3240-f687b1ab698c@siemens.com>
Date: Sun, 7 Feb 2021 11:17:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
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

On 25.01.21 13:00, Andrea Bastoni wrote:
> Hi Jan,
>=20
> Here a proof of concept for the cache-coloring with/without driver approa=
ch (works, but hasn't been tested as much as the old version, and we have s=
een at least one crash in our tests, but it should be sufficient to have a =
discussion about the direction).
>=20
> The patches until 0018-configs-arm64-add-coloring-example-for-qemu-arm64.=
patch implement the previous coloring approach (+ bugfixing + qemu-arm64 in=
tegration). The patches from 0019-config-always-rely-on-the-availability-of=
-way_size.patch are the proof of concept to realize a colored jailhouse ior=
emap in the driver, keeping the same logic between the hypervisor and the d=
river.
>=20
> The "get_bit_range()" is refactored in a single place already (0020-color=
ing-extract-get_bit_range-logic-and-remove-offs.patch), but the main logic =
needs to be replicated between hypervisor and driver [*], coloring.c doesn'=
t get considerably shorter, and control.c gets more complicated because we =
need to distinguish when the remapping is colored and when it's not.
>=20
> Most of the code reduction comes from the removal of the cache_layout aut=
odetection, which is "debug only" (and could have been removed in the previ=
ous version as well).
>=20
> Overall I count for the previous approach (patches 01 - 18):
>  42 files changed, 1337 insertions(+), 121 deletions(-)
> For the new one (patches 01 - 23):
>  41 files changed, 1233 insertions(+), 127 deletions(-)
>=20

Thanks for the update. I think we are moving forward. The diffstat for
the hypervisor (with include/) is getting closer to an interesting range:

 32 files changed, 721 insertions(+), 122 deletions(-)

But we can still do better:

 - make non-colored operations the special case of colored ones (e.g.
   map_uncolored(...) =3D map_colored(all_colors)), that should further
   reduce duplications, both in the hypervisor and the driver
 - make sure that only the calculation of color bars' start and size
   is arch-specific (where I still think it belongs to arm-common...) so
   that iteration & Co. can stay in the generic core
 - pull all coloring unrelated refactorings to the front of the series,
   e.g. the panic things, to allow taking them earlier
 - avoid needless static inline, rather provide linkable stubs on arch
   that do not support an implementation

In addition, some consistency checks in jailhouse-config-check would
probably help to make users' life easier. Or may even obsolete some
runtime assertions.

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
jailhouse-dev/8e7872cb-ea47-9c9d-3240-f687b1ab698c%40siemens.com.
