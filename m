Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCVX53VAKGQEB7A6PZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D0957CF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 09:04:43 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id j10sf6534853wrb.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 00:04:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566284683; cv=pass;
        d=google.com; s=arc-20160816;
        b=O7uWvVaZD6A8Xo8Kg0oBQWGGcRWWRLi5SD4GbLI08VooVogHXV8NMNTjbd1eQJFXe9
         4ZGTv/LFq0C3gtiD7dJbn2/QJ62xuA077j2qOX6upeRMVrcboe8NPDeSh0lzJ4gKnoiw
         k1OWVoPet47dKKo980t9VtwNuHXMvk4vHkV1Of/6aahRJ5DS1m2A/UgnCjLdoQhYQ7Zk
         VafmSBfsYRagRxApKeZ4KOsd/q9rzD+cZM3+ezbBeXAwViA7oAVUlMKSIOxtY3JOjmx6
         L//ZmD1oVF/z5axICKrIReYETMblxz8NjEQiyajw6JnhgLZ3MQz/B6hsWpQIahGGj/99
         Fz9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:sender:dkim-signature;
        bh=tG8FEW1mqSFTqk5xPnYvF3S00B8Wczs8uPba1295UX8=;
        b=WY0ONGekaQTZwFz71afkmzleUX0YmsC/BZeunx2o1+sbjbEgDmeh8WHPQ0HKfTU1s7
         ZPitjhOHmOSsVNnJqFEc56ZxYJs6tt/MaVkqAbQM/y6duQf3msUTb6QCBxm5ge3vLW/W
         7zHLkMNvk2qaDLOo4O17PeIKYTfu8KfY88vfJbjrCcx05dHkhqTsLwYOCkVLXJ+4T5Aw
         b/MernYo9TwkIQTyUh3psgfU+DyjL48suLsyNnNfF/M9eIlEiVU4cmS3W6CmGPjfugSb
         0OBBs7WhLHQ9XX014eF+r0o2LiTcaUxr6hJWIsjdlY2/GySYs0IAyf1PXUa0PKnwqy3M
         rWDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tG8FEW1mqSFTqk5xPnYvF3S00B8Wczs8uPba1295UX8=;
        b=ByfZkZ7FpFP14I/t/BCyxuYz6cSfgEgUTw10/OTsAEC2V+4n2X2ImUHlUS0J+qpJJY
         6oLfk+1CgQgh65Y4UsQmTqIWOgWb525ytOtVYqtcwMMvpkrsyVWpjSzMow3G79zlFP5V
         iCq633xiCH39QMVSqWVStnpSDgKl8ghDruzlOea081nIJ4Syk9rPpPPfdL9flcduK+oI
         ontBLxPINQoft3CBCdSfteHJesJzYAZLJyEHtfH6Qx7Sn74WhC9u/zOlPlrvHeQJ+evH
         Fl3R01nHyQRhjQ+sLlnnrvSSekHwZo2CU+0vxVnJb+0w2Dk8wSf/yxG+R08h5V1I+w+p
         1skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tG8FEW1mqSFTqk5xPnYvF3S00B8Wczs8uPba1295UX8=;
        b=aahaQeTcnnVsD8W0LfQ+QGBpBGJvulfFfeu1qtkV6k10yfJTvft9Y1N0PWMQu1w6fE
         vcmsNR+QOlNVig7Wa2fRRDnRihIOEl/UdO/miK4Je7N6sh+1KR9zRU+cRQslm24khncl
         7ue9iAbbRbo3fKxNuZvOdarG5apyV5TTQXLT5yJRk9gPdEf1K7DEVBmGNnGYOziI5Wpd
         wHqdailsELJEdR++UjPk1jgQJUlH/d0s789QOquFCfO7PkWj7q6lbTKrc7mjbWbZLrff
         nC28+5C4/DAPAGdyhle8gYyaKp+azUVWAjTJVtQJ4Nr+Uk8mWwkIIo8BU1SBQEvtMWfx
         Qspg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV/hcw//lyBxOJtuQn0aUDLNWD143qYYIkbqPOt2npr0p/r1V2c
	doUUwExdjdbMKVCdMes2czs=
X-Google-Smtp-Source: APXvYqxgra/anAddF6KOah+ZOOhbXMkQf2X5A32bEwnLmIAZEStLzbm9kKD3ghWqb3dHxavpNz1IQw==
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr23745217wmu.67.1566284683167;
        Tue, 20 Aug 2019 00:04:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4aca:: with SMTP id y10ls5191091wrs.10.gmail; Tue, 20
 Aug 2019 00:04:42 -0700 (PDT)
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr31614262wru.339.1566284682097;
        Tue, 20 Aug 2019 00:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566284682; cv=none;
        d=google.com; s=arc-20160816;
        b=XiXNpDpfXYyLFg37FLonv/0NH24jH4wDKRrpYqQ+Ewz/d0sP8rLTMz+2YICaGLSFE+
         iH+6NZH2T9jwPcth+rF/4u0ZqAxlu1JUz1EtmbXjUDunnOL3GbDJs8oqZBEYCjg6cYoq
         Wp2NB0AstzbSs6GJfqL8XWDWG6Rp7R7TYi+FVC20clhoJU5aRIeauS3TH42kgQraMBYC
         cAZRXQDgzMCtUgav6K7Gz8QsAfpk15mGnXscegAYFRVzZXXwBx6UzTCCUB1jAXPtlhpb
         OTD7aiJ558uNjzbBiC/Iqmu3bYD4dvQsU0Qxeku4Ko1zPFhSCGqXxZSfHuh8N9pHkR9Y
         iOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject;
        bh=zOv5JAi1Ltxov8sB1dGRHarTl4BQNONvPZCAsai7BHg=;
        b=MxxoBQTtC+o1u6s9M4LU2TQW5tTbwM2xxnvZ0mf0qmcBdsgJvuDhHlBiK7bbfbx3Qg
         kxGixIKkFjcuJEHD6qwk154n0a8GyNCAkoWGU6gUfQ95bg/BtfskyZpg/ZJQoEAmf3qU
         ypUD85I0TezVlDrYqHiWl56Hl2oWOZiDRI937eBZlIAyQZ6Su6CG5glHrpCakSbN+ao4
         HZqOuXTHyFCLp5hEBWIi0KRnmuIW88RqlZOr2xRwMVNBF8sCwqSAmRhtVWOWMkYWuQgI
         bFK1k7+hIMpNNysXCjcE0qGLCJeF4PJJdshYtpdgYnpqUqmkwvJGKHT6Zohp3Ed74k+C
         MAlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r189si48918wme.4.2019.08.20.00.04.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 00:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x7K74fkC026740
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2019 09:04:41 +0200
Received: from [167.87.39.6] ([167.87.39.6])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7K74eXw028554;
	Tue, 20 Aug 2019 09:04:40 +0200
Subject: Re: iommu translation table length for arm64
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>, jailhouse-dev@googlegroups.com
References: <56296140-3149-4CD5-BF93-0E27EDE38819@gmx.de>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0d55b247-d84c-fc56-3eff-835388e6b9a0@siemens.com>
Date: Tue, 20 Aug 2019 09:04:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <56296140-3149-4CD5-BF93-0E27EDE38819@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 20.08.19 07:50, Oliver Schwartz wrote:
> Hello,
>=20
> I=E2=80=99m looking into some odd behaviour with regards to memory mappin=
g. One thing I noticed is
> the iommu translation table for arm64 inmates, which is define in inmates=
/lib/arm-common/mem.c as
>=20
> static u64 __attribute__((aligned(4096))) page_directory[4];
>=20
> The index into this table is calculated in inmates/lib/arm-common/include=
/asm/sysregs_common.h as
>=20
> #define PGD_INDEX(addr)	((addr) >> 30)
>=20
> This is all fine for 32 bit addresses in arm32, but for 64 bit addresses =
this results in a buffer overflow in map_range(..) - unless I=E2=80=99m ove=
rlooking something.
>=20
> If my understanding is correct the table should have 64 entries for arm64=
 (for a 48 bit virtual address), but this alone does not guarantee valid in=
dices (https://static.docs.arm.com/100940/0100/armv8_a_address%20translatio=
n_100940_0100_en.pdf).
>=20
> It seems that this was already addressed elsewhere
> (https://github.com/evidence/linux-jailhouse-jetson/commit/d6d452cfb42288=
c1e81027fb93154c9d7b14fcc9), but my understanding is that the table is stil=
l too small.
>=20

Indeed. We have configured a 2-stage table here, with the first stage being=
=20
covered by page_directory and the second, 2M-sized, backed by dynamically=
=20
allocated tables. With only 32-bit IA, we are fine with 4 entries in=20
page_directory. With up to 38-bit IA that ARMv8 enables, we need to have al=
l 512=20
possible entries if the user tries something > 32 bits. If you want/need > =
38=20
bits IA, we would have to configure a 3-stage translation on ARMv8.

Feel free to send some patch, addressing the differences between ARMv7 and =
ARMv8=20
properly.

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
jailhouse-dev/0d55b247-d84c-fc56-3eff-835388e6b9a0%40siemens.com.
