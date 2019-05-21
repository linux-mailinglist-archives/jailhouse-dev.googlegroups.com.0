Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLFJSDTQKGQEQJBPBQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id F367A25387
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 17:09:32 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id c26sf31076380eda.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 08:09:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558451372; cv=pass;
        d=google.com; s=arc-20160816;
        b=q5uTow3IfTi3kIxoGSonc7pO+Qaffa7IZHTHov68kXYqgRhHnpERCHEdaFVV1n21Tz
         9YIGM21M5lwIhkidLxR5CbjiQABUSgt8vCHg8UVRWYrZWtPpV9rSjpOWoaK8lW4EllMd
         w8srOfRRkr+pIW9jO05N5+lhw3ivdxeU64ECqZLBbGIFkkyuJtC/h8SZ1QVO5U8U8jZQ
         dNY/KXSiLxnwgVX3h+6FiEgEx/TScmuVJeV+zbh73Z/Xki9pxFQ8cOb62XF5i7Zb0Hs5
         AKYJdbc2UMdmBs++PSnQT/gINNG6VC25cv0MZdCZM/r1L4RCfgFqN2y5nh2pBqcR1iM7
         YBEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=F3XV9PPDdENjYt92TlE7+e9cN5W1AANrkuWKm5l1KFc=;
        b=W1j1cmEsCr7dGifa6OzBo6u/TnBxyGAT5EoFggbpCVFXBvYex8vieq7Ln8275r4Gc8
         4TaSnf/+uXAddEynPsuVPLb0dE9NKedyfqYIWmix+1JbHoFEctSEMUT2o28TYpAvyXc6
         7CejyIYAggDmpUFTmm99MARejLiWZvUAdlOS7hmEwgWFe6NgH961rqqqm/IFVDzjjK1W
         wMMGsNexLVozAB+KIeIxK2XeENL1FDed0xehLk5lqqtFGpOzXZhYgWpO1prZVOzH/rdA
         lycLfLuHNzEpCx3uKTC1BishKpSRRI9VVJLXoTqNzVky5070DwpkRmxft7VcUY9uApmZ
         JmRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F3XV9PPDdENjYt92TlE7+e9cN5W1AANrkuWKm5l1KFc=;
        b=swUsce3WtzjZs1I4yI4VOhXo2yK0xye8BO/J1ZQYZoxveAZGg2NTJJq/YTUTj5vXKV
         m8UPf0LIuAJN2g9Wk1/zoP/QSICTM8OZA2Tx1nL+tMUQvDHkXQe3wT/BQ6LO93TqBWh9
         vTzOLhCM2umlmXDKftn+I9AX/DxFsd5rUcK/J36ktzO4LRBvVvpUb82k/zguDCrqA7wc
         rNJZWX5vi6bWAxvR78fHgOl+w0k+Y7Azpl+0ITf6VdnFukmG/D7HwDJEu+/nRYgb7bWg
         x23WwOZZlEoaELjby84sz0YcZ6MomETV5CEDTPc/JoSsWCBjt7wm+iyRlUBiLWdcXs5W
         KnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F3XV9PPDdENjYt92TlE7+e9cN5W1AANrkuWKm5l1KFc=;
        b=E2OxexSuOSQA5HfTNCHml7vaLJ3ExUY0h4NbnlggVYNaWct2Adb08SwDbQpKhrUWlL
         np7mr5kyQhNBmFxCFuaX+jpmD7DLp6zmI+bCFH3a1KvT/5rr7T7IP/9Fc9zKRlx00a38
         Ae3lG9/3GDk7rjBLnbb2zByVcm0skjEyzsV6Ye6799UG6JiOiuy1FjssR9R2mXGLUiS9
         /pN0BAQ09FhIXdbrkhofBKB1ugbP3dQTg/zF/8hu9VTlPcjAXdwP2OS/UdY2K/FTwR5w
         DTKi/6SCx9P7fQi0SvzoWc7gyJCVmqQkVMMwfbG6jrjBYpuhCCFCh6geQu+RxoLROYcH
         QBQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXw0SJkWGEPE8QnEUOqU5TW+eRl/NTV6nmhCSqlIsWAcSoJGx3L
	81XbFN4Up2T0CvB+CVCgKfE=
X-Google-Smtp-Source: APXvYqwrRINgopO7WuAXBTTWquvjBwxMZDOHNYLWUQbzJsu8GBDp2/vBMxI724ErIpTH2mKUT56WcA==
X-Received: by 2002:a17:906:4599:: with SMTP id t25mr38667528ejq.197.1558451372748;
        Tue, 21 May 2019 08:09:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:95a:: with SMTP id j26ls1845274ejd.5.gmail; Tue, 21
 May 2019 08:09:32 -0700 (PDT)
X-Received: by 2002:a17:906:b84d:: with SMTP id ga13mr66426437ejb.236.1558451372029;
        Tue, 21 May 2019 08:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558451372; cv=none;
        d=google.com; s=arc-20160816;
        b=P759wepg6j70krIHRIa6DPFEkfHZdcMegYwRZortpkqGs+cthR7GeyPu9V34TTL46m
         p2LWVwpVqf8GFiNfHoN2B5rJMbDiATcKdMaBIMm1UEO5EziU7rI+ko11Oj0JqIdJxiRP
         a41HleFAf9veWhKS4PXPaER+wiBpTZ0lheyjizmpBkUjzVpfIdSoV4VnjX2c6xm31k7q
         eoCy6pnULHjt3HsrMtzncG2HVJy+/hcf8ufAUC83PphDL0HJqTZGxRUWcHwQA6e+5j04
         3ujR+df1J0wYZbjRHnNoQhEkTxtGMYe9020dIWEwDdvrHVTmAmTVOMHJtA/oVGu1VdsM
         WItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Snx+ufFDp4oBXQv59Jiz++envZufb70SPe5UpbJ8pLM=;
        b=P6wdOTaTXDfQc8NMUyH18tQ8GbKe+gbGXuck8R8DojErVuHDgGKPo2kJ8z3OSVe0VP
         bX1XACOP/sD0AToVn6j2/LPHj7JDj0uMAauCCmx52uIBpE8YVgy5uZux+8XEfUdbuYy/
         lxgc2Wud/WZ+YEqlUpeDmwS3xSEfvstqQKhEQXgJ5z/bFPQxwrWg02LHvKrfE5vFPORe
         ZYNYFWWEBgirZWYGlb8Icur6JQ2Zr0gzimiuwHR3T75ovhKbXkYMIDZbh8V33rHHg9Hs
         QGafgUtOhbmdiypqgfcrB8kKmWx2EiN8BVkJaBkMB61cAuHDhV7VpMX7Al6FYWSnUMwD
         j1Jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id t36si2065191edb.0.2019.05.21.08.09.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 08:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x4LF9VAA008734
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 May 2019 17:09:31 +0200
Received: from [167.87.10.196] ([167.87.10.196])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x4LF9U8w023100;
	Tue, 21 May 2019 17:09:31 +0200
Subject: Re: VT-d: IOMMU exception with unknown fault reason
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <4eb2d565-fa3a-4742-435b-d4fa1469c60f@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fd82641f-4f35-3674-af69-68fb41624fd8@siemens.com>
Date: Tue, 21 May 2019 17:09:30 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <4eb2d565-fa3a-4742-435b-d4fa1469c60f@oth-regensburg.de>
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

On 21.05.19 15:45, Ralf Ramsauer wrote:
> Hi,
>=20
> we have some issues enabling Jailhouse on a Intel with a pretty new CPU
> (Xeon Gold 5118).
>=20
> First, the CPU supports PKE and Linux will enable it (CR4, Bit 22).
> Jailhouse won't start, as this bit is marked in X86_CR4_RESERVED. Didn't
> have a deeper look into this on how it affects the hypervisor or
> allowing it needs some special treatment, so adding nopku to the
> commandline will keep the feature disabled and suffices for the moment.
>=20

Known issue, see https://github.com/siemens/jailhouse/pull/23

>=20
> Anyway, after enabling Jailhouse, our system freezes and we have some
> IOMMU faults on a Broadcom ethernet card (04:00.0). Find the error
> message below.
>=20
> We have fault reason 0x22. But according to Intel documentation (latest
> version from 2018)=E2=80=A6 There is no 0x22. :-) I already checked if de=
coding
> of the fault register is correct -- nothing suspicious.

Table 13, 22h: "The Present (P) field in the IRTE entry corresponding to th=
e=20
interrupt_index of the interrupt request is Clear."

Wrong IOMMU unit set for that device?

Jan

>=20
> Any ideas?
>=20
> Thanks
>    Ralf
>=20
> Page pool usage after late setup: mem 704/975, remap 65560/131072
> Activating hypervisor
> VT-d fault event reported by IOMMU 3:
>   Source Identifier (bus:dev.func): 04:00.0
>   Fault Reason: 0x22 Fault Info: 19000000000 Type 0
> VT-d fault event reported by IOMMU 3:
>   Source Identifier (bus:dev.func): 04:00.0
>   Fault Reason: 0x22 Fault Info: 18000000000 Type 0
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fd82641f-4f35-3674-af69-68fb41624fd8%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
