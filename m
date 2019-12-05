Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLMEUXXQKGQEZFYNDFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 502DD114629
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 18:45:18 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id 18sf1267310wmp.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 09:45:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575567918; cv=pass;
        d=google.com; s=arc-20160816;
        b=TogHDKgXgptQRSuexk/xYx2RSFh4Tp8R5hht3iqu+isMmmY7eGo3VSd7vdJ+Hq2gGO
         y8O6/92n/6AtAkK91OGsIjFoT7jKODz/LOsPnFlj7NQ31R5iG5dk02Lnt+JYJyoh8tQu
         S5j1uCyDAGdVSRS1Ul1Y4VtaxSMRc739UHynAyksv0fM1V5ihtagXcEkyA7lNTyPEjVu
         XpU/wdgmXCXyVrvyULrfBtjQCvt2yOTREM8U4E0CCPgkIm9WIFbIVkvwPv8vERfpFugs
         Bb6Yp0ELvvRD/5kL5D2RiX9YdVYHa+q7kf1jBES3Qsyjl/NEkrj1bKSj7mLH2b9/g/NF
         UA+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=FQ6mRnpfvhPuwra407RyWzQpLfi28e4MzIpVSgnqrtA=;
        b=Pq/HK/4SZhGEYBuIc+JHXCLRG8ffopuyiHnPZ2bkvN1maJjh8lmgXP4GVblxe5J2ET
         kCrbzbloyYNJUDeeLVCWEmvBeS7OtbkN0j/1xdD+oO0O1koEl+P8h/oSUDf09yC6qq5w
         TVmQObNlbpmiDGod1U0EXc8qkc6lKYoXO+AtolMO1PGMTAgfTNScCvyRgd8reFPizRwR
         snvclr09HjyaSOoVb631sGuFz00mxzb3GOcbTEjuuRCYx9p8qlygT7e1rTJ4K/8ez4Ey
         JaTZnqwtd8Bz28Q5M7Hhv7DuYDweRosUliXrh6xD0s65o0KiwXcGETjaq12xKdMr1npS
         byzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FQ6mRnpfvhPuwra407RyWzQpLfi28e4MzIpVSgnqrtA=;
        b=SnuOIR9fW1lslH8RgXNnMlDS/7ozUKLfzLQp2FCC1+f2Sg+UJrj0DR7fOEnwJXyYbT
         o6fI2Izhe0dmjNPMwJy4IClkLWAkuun1+eXAC9VVCaLLnpjdBE3m62y5oc25SvYAR8QM
         YF9ZvzxDzzw6vvL2gsA6TGChRS7jgAgw6l5Wc5GIPgM/ufo5BHi/VH2WPprYvwF+ZkJz
         vaQRNpCKA212/119OH3dRgzAIkkYinUGp47aUzrGu+FWxgpTn6Kz+mnloiKNEyN9Nugc
         Ch5ibcvuLRMywNhrMoQEBVhleadunHj6c3LnI8SvPxMVHsQ2T+HvD6QvS0fiItexmJej
         XuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FQ6mRnpfvhPuwra407RyWzQpLfi28e4MzIpVSgnqrtA=;
        b=TzJgUuUTifJRcZya/3vJg3wlbW+7kmYwh33o2xdxRaEbMoUA+Hy8SXF8GNYncyW3tW
         UKKMJ/oz5jsv8fkqlABIFgHSaPxJ2qI+91X3A0yEKfPl7Dga5Nctc6NmGiv+teL9HrLS
         qq5AGqSIp1Icg5jQVKTHwHkekmPOwY6jMp0QG2bWg3HCzzWUi77n1t1EWOnT0bBLX19P
         0oEV1fhWX2AEmvCUOtX2FySUgIf4RUnk8/B/Q1Ca7c/jCUURyBXTrAMv9bCIRB3Lf7Qb
         S10No30SnOdpjFggHzP/WcyenI8S0ZtF/m+Dh2jvscH+pCL6JhGS6Iu40y24FfbdPqvc
         Q+mw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUW+V2xfu1E+V5OlLfH8Io5CKx1S9R5Bud9LZb2J5F4MicEC2PD
	0jTKXJlcJ1UvhHj/2JMydYk=
X-Google-Smtp-Source: APXvYqyrNXn1VGwkNxcZBZ1joxC0H942+8+ZfCgQN1joYwtx5JcZbpE9QEGhFgD0QiV7URbrmtBxzg==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr11161879wrp.292.1575567917959;
        Thu, 05 Dec 2019 09:45:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ecc5:: with SMTP id s5ls1494128wro.12.gmail; Thu, 05 Dec
 2019 09:45:17 -0800 (PST)
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr6436309wru.318.1575567917248;
        Thu, 05 Dec 2019 09:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575567917; cv=none;
        d=google.com; s=arc-20160816;
        b=ucFCSto5F3UFuBhWM9nD5uWLTgr4wizblupZ9EDEIVv0OQzreuPdiIDi/asLmqyr9r
         a6lRuh/mE0nhZ+qfi2eJti8go/LfS4HMRrK6eNd+waLNoKVht6dMMAu1WnbkbMmuGHXY
         52kbr5mqK14NLsNqgdZKIBXIgcioIVgwN412SBh9FcSjIV3y3H5lyt1df8OeV4sNYD+v
         ObZ6UAlzx/muFmUAdLayhtWs8LMI7IB4vsT56h9OOPTW4LcPB3rK4UbssjEXvvax/shO
         1yWCaohYUNoaGgragpVVBt//lSqe9SFT3zuOniLpHp9d9AHST7eRZw1aLj6UT9MdP9Ee
         xkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=JwXGAIx1cdtMtnqHZGUzwVtO/8Un/VOO+JE8LVps3DM=;
        b=xJM6y1rxroZBWKUPYNK6YYfIlefIFo+Cm7sH2+215NGDrWoYbmm4Pz8RQgwm9CNFDG
         n3mF1zp9RSM860Ik4QYZw0ea/NFZQgCJX4oB681TCKLiZIq1S2V2QZkeb2ZS2RLdKvO4
         EYHBcxeNAzSxtR/h+4APo85opZP0e3U7AIBtYcOoP8vkGZeFw3Z7MvYJeuwKPcZOMmQ8
         LMycDxvBecOqJH8ad4wy0y0SuFU+H2VBv74Koh69pNiKi+IJD/k0WVCc7fQ/V52C0kqG
         bdQ5sgKQyjUmI/yRH+YfNV3ePAduxzQ8ncUjTja6atSaHWH+SKJh9cmINVAdwXLAPDP1
         Mbfw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id r11si621468wrl.3.2019.12.05.09.45.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 09:45:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xB5HjFmd012929
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2019 18:45:15 +0100
Received: from [167.87.38.32] ([167.87.38.32])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xB5HjDVF029772;
	Thu, 5 Dec 2019 18:45:14 +0100
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
To: Marco Solieri <marco.solieri@unimore.it>, Peng Fan <peng.fan@nxp.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
        "marko.bertogna@unimore.it" <marko.bertogna@unimore.it>,
        "tomasz.kloda@unimore.it" <tomasz.kloda@unimore.it>,
        "giulioc@xilinx.com" <giulioc@xilinx.com>,
        "'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
        "fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20191203004700.cw7fgubui363mxee@carbon.xt3.it>
 <AM0PR04MB44815D033BBEC85ABBBEE5DB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20191205165031.gl2f4tbx3klq6rfy@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f590e962-ab8c-ec84-abe5-65b7a3fa4377@siemens.com>
Date: Thu, 5 Dec 2019 18:45:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191205165031.gl2f4tbx3klq6rfy@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 05.12.19 17:50, Marco Solieri wrote:
> On Tue, Dec 03, 2019 at 08:41:13AM +0000, Peng Fan wrote:
>>> On Mon, Dec 02, 2019 at 02:52:04AM +0000, Peng Fan wrote:
>>>>> I am reading the patchset, but this patchset could not resolve the
>>>>> cache contention between root cell Linux and inmate cell, right? It
>>>>> only address the cache contention inside the inmate cell, if I understand
>>> correctly.
>>>
>>> This is correct.  The documentation reads:
>>>
>>> | Since Jailhouse is currently lacking SMMU support, and since the
>>> | colored memory mapping must be provided to DMA devices to allow them a
>>> | coherent memory view, coloring for this kind of devices is not
>>> | available. This also explains why also coloring support for the Linux
>>> | root cell is not provided, although possible and tested with a simple hot
>>> | remapping procedure.
>>>
>>>>> Is there any v2 plan to address the upper issue?
>>>
>>> Forward porting to master and integration with SMMU support are the two
>>> most important task on my team TODO list. Once these steps are done, it will
>>> be very easy to also have root-cell colouring. I have planned the firsts for
>>> 20Q1.
>>
> 
>> NXP i.MX jailhouse has smmu-v2 support, but it currently conflicts with
>> smmu-v3 code in upstream. I have not find time to restructure v2 code. You
>> could refer if you need v2.
> 
> I know. Do you have plans to merge SMMU-v2 support in upstream? It is very
> important for colouring Linux, such as the root-cell. But I am sure that many
> others than me are waiting for it.
> 
> Also, since v3 support is only preliminary and the SMMU is not really usable, as
> far as I understand, and since v3 devices are quite less common, perhaps the v2
> support can be integrated easier and earlier than you think.

1-level translation is complete, 2-level translation is missing. The
latter is only needed when running CMA-requiring devices in a cell that
cannot be mapped into physically contiguous memory (e.g. via
pre-allocation). Due to the involved significant complexity increase, I
decided to not take this extension yet.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f590e962-ab8c-ec84-abe5-65b7a3fa4377%40siemens.com.
