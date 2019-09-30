Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBJFNZHWAKGQEV43F2NI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323DC2639
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:25:25 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id a15sf4966724wrq.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:25:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569871524; cv=pass;
        d=google.com; s=arc-20160816;
        b=YniCXr/TZ108UTR9wvvS/G7q4m5lr/o0JoTCd2iacroIeis9w/AGZBZ/r9G2jsKAA2
         c7SPqslNrmDnAC0+Evol5qfK959algfs/UVFONRYXmMNjxy+oUDZ7hTz86OfT22h2+1c
         wHC5wbBcbK4Q8vyfSutabbQ414SuvOF5HJ7e/9/bVhu3z1R1vhgX6c0d7aWnmo4rDoNB
         U9eo4moPxnkYzBHB6rt9VOvs5Od1QfMLF30FrO2hot6W6cnm6ZwfJbBORoS5uz/5xHFn
         xHY4d95gSgTngiVfAqDl6VNsRuv6+kYUpI5m8tHYmcZKoKRTS9HT4qkLsTBEF1idpa5H
         B+ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Jrp5teWBbcD2afwCbSQjD3bXP0zf9tA0sxxi7t67z5o=;
        b=N3SZESLDbqLl8AhemtJJdNZzSdPMjB7FmMjQVXASu3RhAxqq9Wjkxkab9tdK3Pdi52
         MnuzkICC7n9MTEdlQIuLZ6DvysRfDdEOYiTdGku/VcD0IVRbrNCJ98Kf1r/GFQod3cKo
         ++6otsg4mSZfT9e2R2zo1knGvaqM82Cmo9FYLeniomv1YV3ya7AJnO/jj8xrpxt7t4g9
         ClG71mLSf4rVSbxbncIS8mO6vyZ5bh584Q7tJHQRrHEvi9tuat+xBpJrecCH6m+7q+9x
         EEy8w78VGm8DHWlYMh/lnOI4z6ObJ7DYbH88DCMDtRrnQLfoBg15gl9Bv538H3xpK0l2
         zL2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=PevXMvXG;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Jrp5teWBbcD2afwCbSQjD3bXP0zf9tA0sxxi7t67z5o=;
        b=nOiFf6HqqYdsTyN087Mmzd0U8ry/5vs5+6Gu+BEuvT+WYDdoEUIFhhUd5ssctrt0Xd
         GtUbpYCfoQ75u1t3t/1/kdtHgE9h63nAx991K+B1s6T0xl0Idkrb2tKtHs4GOBwoyret
         g8YAsAlFdnF0lpe5thOnu03qumMDmrAv8dLUfDYFuWaonaAvvO+pMBX+k/dfkW/c32Vd
         WvxpusadITD8+YQnFc2t13fjLdJn3cK0sCSTMJy0NTZO7AT8UDrPlCpFbzbZkx5VhlmQ
         9tPKHoK3TKhkNto/XZ/P+0mq5aJgSRuQrG+vLnmc26yRAt8F4LIE7lbOSrWb3OEuktvq
         ZU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Jrp5teWBbcD2afwCbSQjD3bXP0zf9tA0sxxi7t67z5o=;
        b=QJti4CyIF9tB4MEoR6/GycbR6GWEJ5yU/uJhJP3zCiY7E/sDgaiIsp/d3tetfZAeFK
         0p1p3Kq8gybKiCtaw19lFSnwKi/zEEBO+R988nD5fvdYhdRxPW5GcegGF93bIF3KkHv5
         HQLVUNehtnwLA95ufVebXya3gyaKOzanwoeWtV4kHVA8U+gHVOSNfov5uNsf9ZQncoOg
         dwGzubd3rO6o2aLzLC7+K7MJKYcnSmtARYQW6e53I+93NI50oMqHcXLUFGNl3wqvdmCt
         UsZYUK7dHMtylBsla7PkzJA9NxHGWFc/W3eCKjddhvNdvsOo00VVU5dITrl3N5lwvKxH
         hLnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUoEjZxExfeLdMnB8FyW4+mGkuSzNNz9z2kcOp1f1IJomqMuf4i
	rN6jQM/RH3uaPrf+pynFHF0=
X-Google-Smtp-Source: APXvYqzBDON7Xi1LqL0XU+lq2FYuyxVGDByCQgvIQE0G/c1QE1MGQm/TfBBRBb+YEHfPvq6l7aao5Q==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr559672wmj.121.1569871524811;
        Mon, 30 Sep 2019 12:25:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:c143:: with SMTP id r64ls181484wmf.0.canary-gmail; Mon,
 30 Sep 2019 12:25:24 -0700 (PDT)
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr653155wmd.14.1569871524237;
        Mon, 30 Sep 2019 12:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569871524; cv=none;
        d=google.com; s=arc-20160816;
        b=ek+THUgO0jTA4J2IrvGDPOz2tHPvdc4tg907jdM/GPQm/JAGbOVebOGed6uE3gSntB
         WwcuYrgmGohx16sEfQlhDAN59vj2MFfYQQVuvB1XzcJIWvsjkwB4/YB9l+Mczy5tEWx+
         P/tEEu0UDOH4ID4PK7ydyHfBuGT+pfDveumjgpcdE/2zb5iq+z3Wfa/yTress90rDkhn
         nuFwkhGA6GmwP6cxh97Ny75CJTqQxOVhDGQQeyQsSTdkiXaufK9uHbL72YQRciWBL6z/
         H56jRaM13dZxm/1F3CyMItE/DKpSWAv9ZtftbVjfidzzdouvMejr8I2rR74OJulFPoVe
         OHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=H8PgHT7b388z4VHW9NqDAckYL0EFeuSWsfscxYdhCc0=;
        b=eIrIBCBelarLOIw8vqD8qBQKdXa8hOyp9rjYfMf1pSKp6jp0tIgAPUqJIgm2kOxqDZ
         EXQCVnoT2ScprMhfXZeuyek/6M+WsNUOSgxbx9khG5ewFbP6qgCC6oTYKae4cx6fMqXm
         NpCEixwWlD3rnfx37zH3fv65eIsKnyGuaIJEORtkPlAUUobVXwtgqRD3r6HzEsEmTigX
         uBTiIm+ir2vhmFCG/pSvEEMvrcXIEpUQdmDBwFrElrdg4+ErM1PlBCR8ngv26w+IzUwI
         9cSKcGE84Req8r9TtIVxle5Ib/fuI8rpLrkToWsQF5l/PW+onAH7YvXYqy3GYjJAvAlW
         6atA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=PevXMvXG;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id i7si834524wrs.1.2019.09.30.12.25.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46hsmz69ZXzy9v;
	Mon, 30 Sep 2019 21:25:23 +0200 (CEST)
Received: from [10.0.0.104] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 30 Sep
 2019 21:25:23 +0200
Subject: Re: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for
 port I/O
To: Jan Kiszka <jan.kiszka@siemens.com>, <ralf.ramsauer@othr.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <724ad1a6-00b9-b921-122c-25c26e75349c@st.oth-regensburg.de>
Date: Mon, 30 Sep 2019 21:25:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: de-CH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=PevXMvXG;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Jan,

On 30.09.19 21:19, Jan Kiszka wrote:
> On 30.09.19 21:13, Andrej Utz wrote:
>> This patch series eases configuration of port I/O devices for x86
>> plattforms by generating an initial PIO region list. To sustain previous
>> behavior, most entries are disabled (commented out). Only whitelisted
>> device ports are allowed. This includes the peripheral PCI port space.
>=20
> Did you also try what explodes when enforcing the generated list? I=20
> mean, if there is no mess like with hidden memory regions, things just=20
> Just Work (TM).

Not yet. Analysis of additional whitelist candidates shall follow.

Thanks,
Andrej Utz

> Will have a look at the details soon.
>=20
> Thanks,
> Jan

>>
>> Additionally the code paths for memory region generation are cleaned up
>> and streamlined.
>>
>> Andrej Utz (4):
>> =C2=A0=C2=A0 tools: jailhouse-config-create: Rename regions to mem_regio=
ns in
>> =C2=A0=C2=A0=C2=A0=C2=A0 preparation for port_regions
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: abstract parts of MemRegion into=
 IORegion
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: simplify integer formatting for =
regions in
>> =C2=A0=C2=A0=C2=A0=C2=A0 config template
>> =C2=A0=C2=A0 pyjailhouse: x86: implement pio_regions generator
>>
>> Ralf Ramsauer (10):
>> =C2=A0=C2=A0 tools: jailhoues-cell-linux: cosmetic fixup
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: remove dead code
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: minor stylistic fixups
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: simplify statement
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: introduce new class IORegionTree
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: move parse_iomem_file to the new=
 parser
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: make regions_split_by_kernel sta=
tic
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: entirely separate IO parsers
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: remove parse_iomem_file
>> =C2=A0=C2=A0 pyjailhouse: sysfs_parser: move find_regions_by_name to IOR=
egionTree
>>
>> =C2=A0 pyjailhouse/sysfs_parser.py=C2=A0=C2=A0 | 245 +++++++++++++++++++=
+++------------
>> =C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
>> =C2=A0 tools/jailhouse-config-create |=C2=A0 25 +---
>> =C2=A0 tools/root-cell-config.c.tmpl |=C2=A0 21 ++-
>> =C2=A0 4 files changed, 176 insertions(+), 123 deletions(-)
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/724ad1a6-00b9-b921-122c-25c26e75349c%40st.oth-regensburg.de.
