Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7PT4CDQMGQECL27LSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F003D121A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:15:09 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id p13-20020a19604d0000b029038be656b5c5sf519998lfk.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:15:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626880509; cv=pass;
        d=google.com; s=arc-20160816;
        b=twaKlMvZ0SJNH90uKrAWiYFCuHgUicSbQsSfKDBfRYgjYzrYHBtwl3FG3lJBpN7LHB
         0Ir/QrXtIkiKt6t3B22caJIWi88YmNBbR0aj/Bf5oC2mqyBsxctv91mpmxecwsQn60s7
         2v+LT3Fj0baX1UgiVdzH+qnjkrhp+rhL2HDMd1SwZkBnfKolvG4tvnWRPFx9h+axR+Eg
         P7PdO1/MeasTFULhZlGhA9KMRyNVC70gm7a4MJsiO++1FNW8CjpIN45y+A64qdnrWSmD
         ohZ+sGfaVAEBiqZe0xKZYlAjKWzQv0b90sOm9dW/lVD+VTeqA8GR/YWwiaLM9s1HX+1i
         Fd2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=S6PVYFWMQI+Y6B4dnTvnSr5mCYHTQV8iTuU1LgzkNNo=;
        b=dTVTu5sv7mkcTci7XXNQczkuIPVaJDevbuaJrEI7Mqjvyry6WtVjECogbXN6rt0jaq
         2zhIblesXTMkw1okRgFA1DdImW0vajPfFr00VosSTtauxeaOCoDzYFW+G5aySC/RxEXo
         6QWADiol7IgeuXqZfCNu6VAn7LbkuKc9YuazVEm9AfXbQxZhU8cE4dU4CbhgsKmru3+r
         YlGQ5q8RX1yBYs1huB6Fge0bmGQRozWFvmnCg9VR790M+JDjlteNxX+/PtF9V1+uF38n
         KpjKrb+7ty1u1P3wWncmsHVhvQTER4zCSWnH0R0/XXUdTbvC/tdpzPcN0ITaygc1Rk9U
         QsWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S6PVYFWMQI+Y6B4dnTvnSr5mCYHTQV8iTuU1LgzkNNo=;
        b=MXnvz4Oka5d+KIveGGEuiszoouMMWYUvK44ngHv84sobOAiNaV+6bY3W+Vb+QdBFrC
         l+XXNAi2ojlS6ev1H7g1tkCRzTx8d2i2xdgywxTG+xnukfa2ZS50JABn1tTvOiaE6NkK
         pjnDA9I80mZ9HnNm4a6HFY6UCY/qjgckpJfZMoagazToX6P4V4SK+8uF76NWw1Bzexgk
         J/1eXOCOkMzexCJIyxeYoEl6rlqr3imsBsoFovhbXlbgLmmwGk80YKXdDehaL5CWByoB
         CC9YyOhUj8ikxszh4N3ViEs7lxeal5hlZExYM7jWB+brK9+/mL3s9xhA4vKgvtGsRc3P
         zWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S6PVYFWMQI+Y6B4dnTvnSr5mCYHTQV8iTuU1LgzkNNo=;
        b=bI/CKytr428ttXc3VoNddADqnsMS8tsG3T/ALtFN8tkWdBM+NYLZAXyRxTZzO5v+/q
         SutejswyIp9m6H9EhCr1X+5SpAwTau2x7+paS80dIPJ3vn++8Ao6Cg+6/oDMJKgzr/Yi
         irPBfKIb+9q8CVR77WVsKCMKZgHxYN+Zcw55vsX9dXuCW96Oixy+tRA8CwYWUIDshsZ2
         yRvyKASKmi8TEvSBlFiFcLbBi+Sc7ApTU6PoJD5zs4I5U99xtpPkPEXX918Vr+u+NiUY
         y2/VIs9C8tYTXFkpLstvYUIbOi5Pbb2rKBViH+j2Wh0DvagwlvFIPzQQzbYvljkwdwHV
         OO/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530aUy41xK56YBNB+IxpcFNQqSLL1ITvZzeVbL8isUu4+e8ySEkH
	Dt+Iec6lf734a4iMIM6xECE=
X-Google-Smtp-Source: ABdhPJyG6y4LVsZA4OymlOgnj5EhRuMpZAoURnx6kQZ7q9akConIFRvCA+qaE2q91GsgGaPiXWClyw==
X-Received: by 2002:a05:6512:3d1c:: with SMTP id d28mr17010394lfv.474.1626880509410;
        Wed, 21 Jul 2021 08:15:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:430b:: with SMTP id l11ls288667lfh.1.gmail; Wed, 21 Jul
 2021 08:15:08 -0700 (PDT)
X-Received: by 2002:ac2:5933:: with SMTP id v19mr27023548lfi.85.1626880508159;
        Wed, 21 Jul 2021 08:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626880508; cv=none;
        d=google.com; s=arc-20160816;
        b=zNg+HG5nGmV1f9PYIU45vyzkFZjaEaJ5VAaPq2JYfGgqyn1WrD+8/iC4cXWi99XyDC
         lZWhfxXYY2zVBkU/43dw49IqUtJ8IvPuS5bhUQ67vg8fU6Mxc4dJJoELnjwl7mR7bhNL
         dgPHROUPOJHk0OSquhIjRxhHUxm1U/rOJtGjl+i0i6XJVbWznMuSm9ovR/W7qadUKGD5
         iR1hENyBVqzubs+hSQBIUrPoFwLYtk/bNSZkavQbyH7z9U5ggP34Zg+nc1TnBD0Z9b67
         WirQpvU4Ma00pVewS1I1Srj9tapMj+xjvF+tEVNYspSow6btb/aHJL/wnCJY6BiuKSzM
         ywLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Qq23DMZUavSGeMP/+BijYQAef/N08uUkiVZtdYKkMyQ=;
        b=G9/M0nY7UpSgqnzZtumu79F6aAAqUzvTF4zt4XsTUpb8+MR29g8+EqOyY+VgV8Fj6P
         wKKBA60sxeZn3sZkV15BXNOqIAaqiVH+OdW0mRu4NN4JiOIYYWbt2hxeoTjXX26yWsIG
         UZ7zKfJ7SzPpZFuWB49vTrJ1FWtwu5Zz/IIhnAAMNbaycbAtpuF75YANxeRMedinlorl
         yDjx/4oFpq5HAO6EzZfNhBg+tJEdsnRERDA6kwADjYT+xeXntQjHt7MpWDOH7/1l0Iex
         IZCLHaFpj0h381hzYz0ftI2Ve+F1uoLPXHhUesNLXj8+8Lm/jXwVZT031bTPLdOc/HP9
         nZTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q8si1346558ljg.4.2021.07.21.08.15.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 16LFF6ql021297
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 17:15:06 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LFF6Cg027871;
	Wed, 21 Jul 2021 17:15:06 +0200
Subject: Re: Will jailhouse support RISC-V in the future?
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        along li <v6543210@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bc9a4b42-034e-4be9-b364-ee5f6e2964a1n@googlegroups.com>
 <a6533b1e-4149-a0af-0e98-38f18ac77e8d@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <58fca573-c083-8067-9dda-8508cd2bfd92@siemens.com>
Date: Wed, 21 Jul 2021 17:15:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a6533b1e-4149-a0af-0e98-38f18ac77e8d@oth-regensburg.de>
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

On 22.06.21 12:47, Ralf Ramsauer wrote:
> On 22/06/2021 12:05, along li wrote:
>> Hello community!
>> RISC-V is very hot now.
>> Hypervisor on RISC-V is=C2=A0 starting.=C2=A0=C2=A0
>> Xvisor is doing some for RISC-V=C2=A0
>> Xvisor_Embedded_Hypervisor_for_RISCV_v5.pdf
>> <http://xhypervisor.org/pdf/Xvisor_Embedded_Hypervisor_for_RISCV_v5.pdf>
>> And this video in=C2=A0youtube
>> <https://www.youtube.com/watch?v=3DeNUn9uMPcCs&ab_channel=3DTheLinuxFoun=
dation>=C2=A0.
>> Will jailhouse support RISC-V in the future ?
>=20
> Please have a look at the wip/riscv branch.
>=20

In fact, we already have more (that branch is just an empty shell) but
unfortunately not yet ready to share. It's being developed in the
context of https://www.selene-project.eu/. I would expect to have more
within the next few months.

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
jailhouse-dev/58fca573-c083-8067-9dda-8508cd2bfd92%40siemens.com.
