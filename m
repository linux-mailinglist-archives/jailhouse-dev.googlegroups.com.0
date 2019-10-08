Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2XF6LWAKGQEAAEOBXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F02CFE59
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 18:01:46 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id x13sf4401449ljj.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 09:01:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550506; cv=pass;
        d=google.com; s=arc-20160816;
        b=07ZOU5W/FeKN28R++75I1WXLk0ayliqsuiEHh6OBZvPH9/OPk3n2A4t4aHcP0/gmfk
         SI6jnZUUAUbPMtCpzF4fYaT4JTWIm899QDxC7v+ehKsjZbbZ88MpB8aaevODHb61Pypp
         a1vshpY00nSyIw4QdQImB2Qg5/YquromFqAOk8emJzoEAx2Mt+tLlLeB6958EuIGmG9I
         0lVx6uwMsYiuEMVrwt4Q5w0UbFQ4O0eiQvaEa38i8kvsratR9wgba6SMKYv3+QmSVbU1
         ufXingn/D3W53RekpDNA5j/ciTN9zBdwvxFFY8rzl8NHjg4eJ/r3zwZywqZOGZ+2lJ4G
         k0FQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=48Jl/FyoBWM+9pKZ0veMQimtJIYTLge+A0ZqL6xIE64=;
        b=hoEOHfOtNqsAp744KA13KOOP4OKcH30RFRI1MbwUNYUQm43jiN1h8hWSsr0lFnOuhw
         AXL+LQ1ag+oI3WP4ngqmjJIc7opgYhjzrgfZnRDRzHJuYezuUj6TGLdXaksYkXynOJb1
         5fCf8ByjAU5EXElXhqTnaLUJHTGJ2nkAcVsYTNZHTSTkd4owiU2eHrVxlftQeMibnM8k
         IdmiLU68y5h5kX8EAU3YXQ0ZkXzzjx4FbdhTqPA1EGA4+kTnb96pDZW4cNusLHoXUekd
         UghaYIFF3SBDM7vvvkijM6KkiP04PnsV91F/p3849+Vuku5ageVOaOQockzHaV0CM8QJ
         T8Dg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=48Jl/FyoBWM+9pKZ0veMQimtJIYTLge+A0ZqL6xIE64=;
        b=W4D2UHEz68kfHTzCDDJ8Kr/ILMHg/uYpdlHc/jMy0FuF5qIs0dfo1TsB831ftW7spk
         hYUwqtpkTqyeqHu6+uxQGggfmfn14psuGw/DhG5+jzJNABrr5PJdxAXW3KJTPiCh91cu
         0Pi9abvhWlUzCPftRDbcrzWqiaZbn+t0+z9nmdBqWFwXo9zpq8TZFr6TAXvxZadhO6c0
         JGvDNiFuzZcXNnM/c6zAsLEpTIjwfZwMV7wQhqPN6FEy+EJPdPJlYCXCqQ6zgdCOosDw
         LTEN/iH+UuvfZ2ZCtPUYj1UUbsgsrfPVqyek0iWhdnzbyyn8gLNzcoxyCLKVe5X+zaw5
         X5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=48Jl/FyoBWM+9pKZ0veMQimtJIYTLge+A0ZqL6xIE64=;
        b=jzyTY6Et6czRrBylh8GESuvYxgNLMaj4S2dGp05mJw5iJDXxoXtw5YJtmzjQgUJ7Wf
         lutbgaA+9Op5K0z1vvCMfWZx7GZVHpYHplx6cI5/CGgGuw9h9F1ay2M9Q9Mvo6UBJPCH
         /pvkX0HddzNAo3QDOQOb/VP5KAfh08cQzMxb29J1p6ooJgJCidxlXWOPZkh9q2B5jAJC
         58WdmqQlpHZli0ROTOKVwSbY6d/vgjDcmOG+XPx8ECco5ke4L3p+PbXasXxvFOS9T2eH
         NHf/s6Y9RTpcD4zFo6BMLNaDG5iz3sUsLnRQjZvaspPxe5Br6PRAZ5oJ3irVokSz65yQ
         FtYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV2juRzGk4UmWe2WM+MMGeAdp9K18GRSTmCWGqtS+1pEDkL3xL/
	cpwFBvk+DdM5XRvRR2zYHuE=
X-Google-Smtp-Source: APXvYqy4gjzFNyD747K8BQj6PiYJjZOtsFNULauiPILt9av0C1Egzrpf4n/qOtZz/Lpa6ySfSbE0oA==
X-Received: by 2002:a19:c14a:: with SMTP id r71mr20482853lff.55.1570550506279;
        Tue, 08 Oct 2019 09:01:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9bd0:: with SMTP id w16ls538197ljj.13.gmail; Tue, 08 Oct
 2019 09:01:45 -0700 (PDT)
X-Received: by 2002:a2e:8184:: with SMTP id e4mr15157471ljg.240.1570550505524;
        Tue, 08 Oct 2019 09:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550505; cv=none;
        d=google.com; s=arc-20160816;
        b=tX0jvF1pbgOlbJQwHKcJuWX4AWDSHeW57OGy+SRviB/91OKnXu6MiAm/xg3GdffTY/
         F2aZCOI735MDQHfqbSyyykSNEsKnMb1zd94Rsy4WvgKxI/zXI3FNiUDqnu6NtDcT/wDf
         9eQTcAkFMSrJyWHlbx+in2AppI1cmR3Td+Rll4RiOGSYQVDokidNb3guwpeZLT9Gg1WA
         6p5JPonrWn23IzEXIQmYHmuklS8cGB9jjXmpC3vD8di1P4qzZhtq1/OaDnMpDoLIqVOA
         79RawB7HSVN/MVY7e5kpbsS89Vlw+zjjyxkw17peBSsoEY4+RmsawXSFmQRo/pJg5CBN
         4kCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=oSFGipCPBdwknOYmpyMmY70nlJGOmPlsQ8qHdbR31qU=;
        b=a3mqYZudyq6fsS7zZ2t9X46n2z+c/6Ma+fI9Liud+7EpSy3mPgbiQqu6xAmxN/jCqw
         Dk4FmcVPr8mqVxY6Y7L9/x/mNWajOI2LVEECcfN3o7tDrQZAOxeJEk9pMojbHVqfFRZN
         SY4Vu+npHkhk23Cqae7y2LxVWYPb1CpQylOTD0/R/BR/yv++dRxiKq9fbhmzRtv4gbeO
         ayhk01IEpZJfKZKfHe28tZbjH8S0RtqWjhYb3A9TtwRvmvW9rYVrYaN1TBvoihrz+OHd
         0uLiLVbesaAHSKks+hyTeDvZvgPaN0QCluVMNntisWPxiMm740L6ftfNJ1tf1bkgRagj
         qXwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q25si1051230ljg.5.2019.10.08.09.01.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 09:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x98G1iwu008996
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Oct 2019 18:01:44 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x98G1iLT023820;
	Tue, 8 Oct 2019 18:01:44 +0200
Subject: Re: [PATCH v3 06/14] pyjailhouse: sysfs_parser: introduce new class
 IORegionTree
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-7-andrej.utz@st.oth-regensburg.de>
 <81b3858e-05d3-abce-0f43-940656627592@siemens.com>
 <cd7c421a-ac43-93b6-29bb-75fdee9b9593@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5458325d-af29-87f8-c4a0-e0a128b33bf5@siemens.com>
Date: Tue, 8 Oct 2019 18:01:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cd7c421a-ac43-93b6-29bb-75fdee9b9593@oth-regensburg.de>
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

On 08.10.19 17:56, Ralf Ramsauer wrote:
> 
> 
> On 10/7/19 6:10 PM, Jan Kiszka wrote:
>> On 30.09.19 21:13, Andrej Utz wrote:
>>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>
>>> Do this step by step. First of all, let's create a new routine that is able to
>>> parse a line from /proc/iomem or /proc/ioports. Both files share the same
>>> layout, so we can use a common parser.
>>>
>>> Passing the destination type of the entry to the parser allows to share code.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  pyjailhouse/sysfs_parser.py | 21 ++++++++++++---------
>>>  1 file changed, 12 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>>> index b0a9bf44..a179461d 100644
>>> --- a/pyjailhouse/sysfs_parser.py
>>> +++ b/pyjailhouse/sysfs_parser.py
>>> @@ -824,6 +824,17 @@ class IOAPIC:
>>>          return (self.iommu << 16) | self.bdf
>>>  
>>>  
>>> +class IORegionTree:
>>> +    @staticmethod
>>> +    def parse_io_line(line, TargetClass):
>>> +        region, type = line.split(' : ', 1)
>>
>> (region, type)
>>
>>> +        level = int(region.count(' ') / 2) + 1
>>> +        type = type.strip()
>>> +        region = [r.strip() for r in region.split('-', 1)]
>>> +
>>> +        return level, TargetClass(int(region[0], 16), int(region[1], 16), type)
>>
>> Doesn't the style checker complain about a long line here?
> 
> Should it? It's 79 characters.
> 

Did check, just guessed. That's fine.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5458325d-af29-87f8-c4a0-e0a128b33bf5%40siemens.com.
