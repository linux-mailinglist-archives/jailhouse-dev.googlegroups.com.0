Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7FOZHWAKGQEKA73OUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 51666C263D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:29:01 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id 5sf3359022lje.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:29:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569871741; cv=pass;
        d=google.com; s=arc-20160816;
        b=UXqLi2nzCvLh3IG0v9+3+0ItYWDcE8vpKpR4QVsVtlstO/XzilWbZ5rNxrjJF2DIDO
         glBhXGleaXNc9YBbjgRjRNCgoG8kf4GGht2P6Mxfm6cJDIJ9kAZS2Y9fgrsDoxdPOTRN
         O/N4B+TkSfhWWoLWbskV1GxePSEAkyhIJ3YKtNvWouWe/hWeL5km0ywp0ijsmzaSI4M/
         XOjo8oGo9dibVV/azrX1Ab0XtpXV/SARviTXT262MLL5q7nN40NzI3QDiXhqrWxqOcJU
         9hOxYgV52Mo8ynx7Vit1hp9Yvdg8Uu9HvA0RgaQsvr22+kqHGhHZeC2pG5kRyZdUXOZ1
         X4og==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=pyy/uJDVVN4RhGW4i+9U4Xkb346dThNeINJoqr3rgoQ=;
        b=e3ZYJJOpJDBXds5VaZTzC4Vq+lnCl1X1F99k8wKfHX7ymi4VK6DAlx7kpTrnK2FDo4
         JBOtQhZppdlJ+enDCLaYS2EMeo9z0BVh8fOLc6U6kj4A8F+F6yw6o072kguGc05ERkOP
         m6GPskwGaXu8YZuqH3tNoWfQ6MXlicoomPUTXvlGI3LHefGMrWUAhE3ltXF6duD+vlFg
         QF8l/ksbZppnh3X/oCQ5xBZhrjOdLzvol0HGDD4l9mnixZK78D1u6yTRE1f4ei1ObLYS
         td6JGaJg+2DsQVwpo2SHXVooatNmPCg5YRDYSz5oSenvVg/D3xCh/jPhUiQNU0VhloWw
         vGIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pyy/uJDVVN4RhGW4i+9U4Xkb346dThNeINJoqr3rgoQ=;
        b=a1NQLlURnQilQSle8L1PNn8dCqT78Xn90s8IalIZsx15SYh1HE2SlQRibD7BM/ucFO
         /ZHb/xF9Vlh7AtwlI+pezbMIGSeZZ8xCFsAZ/9nE2Db650HoQnTEnfNttEj1Rksg/nMS
         Tqp1CJ6WEk21lpKtYIKGhhMvQXSndk0wYZHhRq/aSeuT3R5OLWWAsuW31QzNdcIXTnlG
         A5xCg0vA5fS3TxIjNhM2ihuXuzEGGt9QulmfM4ODWIc/Dsup7eR6zFb3n3lxNH9sgH4X
         TBmgQKrWEUSfvSrUn8PZetjdY+UVDH4Se+KJj4POtiSMSv62B3eiqyimxCkoI9P16eo3
         jqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pyy/uJDVVN4RhGW4i+9U4Xkb346dThNeINJoqr3rgoQ=;
        b=Jx6ZeUui+tg+WI9PTJzi4MG7uz6htiyMBmFcn8mxBzrtL0RpHWZFOCICoqomDayWRy
         xESVhBpsCeUsJHunX/pLh9A0SDq/vrQ494SLATwgYIDwJhmo4tIFMZa/tZzEoTj52X6j
         XdOIRhMrD4iyn/cr/IkfnQNpxLZTusYC7hh4bF7QvVCAdd9hIULKehBSifYdl+Dso3e6
         d2Q+g4AShRDw+gSMOOcYc87GrWoxBkmgNhTqmEIkR+tRBXLbLsKSGseA43lbp0sPMe/p
         xVOuvexweA+65OaYse4bmUW/9wM4oxKr6rfj7ux500RTFZPYxtQNoI4dd0FKVcfG1O+X
         4GjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUlkaRNmXosXcjFpN3UTwoiwGg+w7zmy5NXNL9HvQfLCTWtF++d
	VPIW1j3WGGrMjuH9YFr6BC8=
X-Google-Smtp-Source: APXvYqx29EJRPVm44K36ALyYLLQoqg8SKms9Gp4VT3Bv+CbJUPyg//C+dKXdUCN8FaLCRJp1+YG1RQ==
X-Received: by 2002:a19:431e:: with SMTP id q30mr12226693lfa.171.1569871740925;
        Mon, 30 Sep 2019 12:29:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8803:: with SMTP id x3ls1650916ljh.10.gmail; Mon, 30 Sep
 2019 12:29:00 -0700 (PDT)
X-Received: by 2002:a2e:252:: with SMTP id 79mr13237990ljc.188.1569871740215;
        Mon, 30 Sep 2019 12:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569871740; cv=none;
        d=google.com; s=arc-20160816;
        b=OtM8k/REpVLCt7FNWdQj71/tFTo+oxTk9O8lrIO/B7CV7DTztNZbMT1CB+8IClZxrq
         C6iqSB9I3C14mrZX+6tGE7s4WsTGF6h28sOTIBuokTMSN5QppWfgmqJm/rRRUeI64Min
         S63+bBlVR6OzzNnlZI4K04m0oY++4SJYnLNH/URFDJSym6o2BKAuBHpOkjZJklKrKJK3
         Rau7rxlpq5MAF/4w9T/gDE3Al/hUKKGG9WvO0Qi0pX8H+3MAi86XDIPEq7ElZd7LKtY6
         YbuNUmRalNgxgjZrpJOP7O/JdiDTmlafIv8d/I9r0SPzW6vwGaWWbgsbbyvb4PM509/b
         vFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=plYv2RIxCK0JlvkiC8FWel5CdGTY92B+NcTpHv1TmEc=;
        b=zCLAUWt1MIQcCOwmiZP3wD7unocz2q5DHc852OrruBY66fg+Fv2ahJpsVA7wRaNpTD
         klR3/PfjVgVh3Jf8DQ2j5gaDghbsXY2wbLlM1uGw/nsA5wrV8QyO0kjeJmyYy7LU63c9
         I6wo6pjQ5D1idDU5Ard5kBACQMa0F4PbEbJULOywRwxNj1IPU2DWKlCfu70FnHlMeZ8e
         LDm2x6mVCLR0rPoiUYAWYH5j0uf1lGuU1Pzgl4W0lGn0OqWNx2p2331QHoOM70tUlnWG
         3Ia6Z75q6spDHuC+DD0utWDRSRQNOkupaFrGxJtFvX0IXpv448uw3oBHvFvNoLcsweGX
         d/Ew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id u24si715479lfg.2.2019.09.30.12.29.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x8UJSxOx000792
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2019 21:28:59 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8UJSx6q013681;
	Mon, 30 Sep 2019 21:28:59 +0200
Subject: Re: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for
 port I/O
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
 <724ad1a6-00b9-b921-122c-25c26e75349c@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f31ce534-911d-ccba-c96d-529eb7a5c828@siemens.com>
Date: Mon, 30 Sep 2019 21:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <724ad1a6-00b9-b921-122c-25c26e75349c@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 30.09.19 21:25, Andrej Utz wrote:
> Hi Jan,
> 
> On 30.09.19 21:19, Jan Kiszka wrote:
>> On 30.09.19 21:13, Andrej Utz wrote:
>>> This patch series eases configuration of port I/O devices for x86
>>> plattforms by generating an initial PIO region list. To sustain previous
>>> behavior, most entries are disabled (commented out). Only whitelisted
>>> device ports are allowed. This includes the peripheral PCI port space.
>>
>> Did you also try what explodes when enforcing the generated list? I mean, if 
>> there is no mess like with hidden memory regions, things just Just Work (TM).
> 
> Not yet. Analysis of additional whitelist candidates shall follow.

We probably need a mixture: white-listing know-harmless thing that are requested 
in the legacy range, combined with permitting the PCI device-related regions.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f31ce534-911d-ccba-c96d-529eb7a5c828%40siemens.com.
