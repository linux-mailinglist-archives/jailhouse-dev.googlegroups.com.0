Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWHG6LWAKGQEZZPRKZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DBCFE74
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 18:03:37 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id z205sf1594361wmb.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 09:03:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550616; cv=pass;
        d=google.com; s=arc-20160816;
        b=FIq4i9prlNUWsowg+zp78xK2kOdVrcS6i3JM9NdmMugTE6lXWb3Wr/6LVBWhGz1OOM
         c4upDgvjHDsrynIOdMrzkCI/quFRDXOUvyZvFStYKnaTddHD9DYjDOmbjpgBFADKEZhU
         9RXjE4M9vVhx1j2hQJ25J3cVacXP9F+fSqkuPQR/gnkpUGIiJgHngio0kJkXuF1AMYym
         0iBUeehxxDPTihZxxn/wTTnkZW2WQqzQlKSoprkL0K41ZfKzIkyH+/g+qIPFxhaGaPS0
         19WTRk7koz0m8Yvv+AU8pcQ88BXezt09RTCSuMId+SolC5e3XN1kCZq30zOh/F6fI8dn
         ZL1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=TN7Qgq13RefDCJTT5pPQmamvbXHJDqsvdIM9r8pMKhA=;
        b=RxnW/+gF2HP9ujyjue6FpEQNqCSHz61LwO8wn+sAAZh+lBMhs/VjUslysvoH+gahiF
         q27Ujm0sNayaY7V5CJRJf4EeZyBm77WHwY7ERGnnh49/wNbPDIQhM619ofMisnK1h64x
         aqJw++RE2ebiposaDyr2oUY97rAxcdpRAqRE2UMy2VPFBNTfwDrk/WnI49AU2LHDDbPv
         k1xv8cvUCiyy26j/Dh1ar5JzXYeIs3dF3Il1xfa80TnEj+agTVhrzFTDtQs0bxnUh7xU
         GfGKPx4b/wL64UawNnjMrrOCrDSHcfJYt9tcVwJ9ovuWW9S4X2naMB1fgQmxmUO6CezD
         aYbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TN7Qgq13RefDCJTT5pPQmamvbXHJDqsvdIM9r8pMKhA=;
        b=LN0Ah7U898yVjORolXQHhjTdkRVyuF9P2iad68fRYPczBT+2ZivFfUoQClRHhB+fbQ
         onJbF2b7b07wY5SGsUp+8vjSDxHzDATnt2ErfIf7dg7gXIfS0946voHrDdi7F5oMAmsl
         lhwyEOedMbRMv88aLjEEt7/l+tyupPd84XQqwzCVjLJnP39SjajI6iax6q8BPhByJmnk
         B5RGMy+xPXyAXwD0ksx1rE9gyz1YpLSVSMo7MT7XHHhR9RdRTCyr9EkqL/pguxDr+nNP
         rEIkK5j+9eZt6Ip45X59bopTJQCIbwm9qcVFEgshWtQMvjNVskHq+aj4cidNv2EV/5VO
         4F9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TN7Qgq13RefDCJTT5pPQmamvbXHJDqsvdIM9r8pMKhA=;
        b=eF9tuUVvaLau6YVT4b4fM8HzOxqKslCIHb3hkPVRCN83K1IussxD3Phwyamo9h80lo
         gdwubiBu0C3JUhHWv8wS6WeP0C67rjE9qBu86ySS/ToSW4GErpBHY9ItX6fFQi4LDRAl
         Nba2LVKZMc54TWQw59PZ6vuSlufhN910Uk7yhrU02JOLMtICNsQwiIan9MUY5T8iv/Xw
         U+ikMDigRaUIsaKFLfYBsDl/2uT7YHMhBO9EAvkGzd6hi2gW1+0rtnBlmktfF5wDBRT9
         nB95KdOD6JlfN5kys/gldd5j9JcA7CTgJFDgjh1mro57tBNzqEFA/o81ssyisNNWX+Dc
         r4uA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWP0n5IzaMEFfhS9iafFM5eIyt4q2ecmiOrM02OdrhhYMHueCMG
	3Wh9ewcLOipKA/KlrEy/Se4=
X-Google-Smtp-Source: APXvYqwEA6OQBxc4HnKVBhW52sWIlMLr8CPdZufT0wHzSnSib7M8K3eANCyVbs8VKy2FqVds230EEA==
X-Received: by 2002:adf:fe11:: with SMTP id n17mr21282034wrr.221.1570550616782;
        Tue, 08 Oct 2019 09:03:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c8d9:: with SMTP id f25ls1499980wml.5.gmail; Tue, 08 Oct
 2019 09:03:35 -0700 (PDT)
X-Received: by 2002:a05:600c:2291:: with SMTP id 17mr4505435wmf.58.1570550615875;
        Tue, 08 Oct 2019 09:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550615; cv=none;
        d=google.com; s=arc-20160816;
        b=LRoA+Y6ABIL+s13gqkoi8yIn57rKHQrCnOR1vxCjNlvBlGvBPvaWvOBksDyIr+9vu9
         sYVCqrYdv/jbyI7DDh2OobXlDhCBz8KpCcDLzRFdctwI9LABEL7FVq2g6lxBRVDJKMDW
         cIn/JkTfXjrYTmf/egVw+ivyW07vSz6uBuL8CXGaiF6nZ3r6+lYlvYwz3PL5lVUbqem5
         +wtgaaBRRcE0y/Z+4lR+NCEws8nSJlKPCpICdIDjZRkJxHbhuQF7RZFjYP2WCLU5EkI9
         ZkHT/D6L+lrOQLyOwIMY5YLOpbEfISDBT/Z1V3gzppQqIsOtG02g0kZIDqhuDTpNLqZ6
         A/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=MiaTrhwhBmE8R9DD6qebuDCrFJaIp6WJ1QjSvV8EUOw=;
        b=yZ2ljI7b6C7uRmVjX0A/9uVUtTKE++Ql75eEa7oZEilQnNQrTCYgRg/umr39RqTgXU
         XyJiAGas3bE4/EAGwQR1Zu9DQeN8FeX5byTjGjebPA5qXm4YVnqzfcdCDZQD5RNEJ+Sz
         7UlnILXOh7ifpBY8vdgCA7LikuQSj9njBcztwlduwAXXPJHDXb4XHapqMNvg70SorPb7
         lgVwURZazQaOOrZxggChcJTyefiJgrjAgJ0mhn/RfbHknJ5rSAKdmk0wkbZf8UgsIah4
         W4y4nQfPiHWLOW2ZERZUUxsgSff9HfflNrSWKkVEAxLJ3Jk2YhMT9yy7di5O+ka3evCF
         4/GQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x8si327960wmk.2.2019.10.08.09.03.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 09:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x98G3Zkp011000
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Oct 2019 18:03:35 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x98G3Z6x027585;
	Tue, 8 Oct 2019 18:03:35 +0200
Subject: Re: [PATCH v3 12/14] pyjailhouse: sysfs_parser: abstract parts of
 MemRegion into IORegion
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
 <20190930193857.2866-4-andrej.utz@st.oth-regensburg.de>
 <f60ecdd7-c68f-b983-b9a0-a34d9ade36e2@siemens.com>
 <348a790b-64db-405b-bfd8-e590043b3806@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <72e26f0e-32f7-88fe-5138-9f35488b6b09@siemens.com>
Date: Tue, 8 Oct 2019 18:03:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <348a790b-64db-405b-bfd8-e590043b3806@oth-regensburg.de>
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

On 08.10.19 17:57, Ralf Ramsauer wrote:
> 
> 
> On 10/7/19 6:45 PM, Jan Kiszka wrote:
>> On 30.09.19 21:38, Andrej Utz wrote:
>>> This prepares for the refactor in following commits.
>>>
>>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>>> ---
>>>  pyjailhouse/sysfs_parser.py | 20 +++++++++++++++-----
>>>  1 file changed, 15 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>>> index 3027f82e..0f91d928 100644
>>> --- a/pyjailhouse/sysfs_parser.py
>>> +++ b/pyjailhouse/sysfs_parser.py
>>> @@ -779,20 +779,30 @@ class PCIPCIBridge(PCIDevice):
>>>          return (secondbus, subordinate)
>>>  
>>>  
>>> -class MemRegion:
>>> -    def __init__(self, start, stop, typestr, comments=None):
>>> +class IORegion:
>>> +    def __init__(self, start, stop, typestr):
>>
>> No comments planned for IORegions?
> 
> Only MemRegions use comments.

Yes, but I could imagine them being useful for PortRegions as well. And
that this becomes a common thing.

> 
>>
>>>          self.start = start
>>>          self.stop = stop
>>>          self.typestr = typestr
>>> +
>>> +    def __str__(self):
>>> +        return '%08x-%08x : %s' % (self.start, self.stop, self.typestr)
>>> +
>>> +    def size(self):
>>> +        return int(self.stop - self.start)
>>> +
>>> +
>>> +class MemRegion(IORegion):
>>
>> A bit strange, this hierarchy. It may match technically but IORegion and
>> MemRegion should rather have a common parent.
> 
> MemRegion and PortRegion have the common parent IORegion:
> 
>   class IORegion(object)
>   |-class MemRegion(IORegion)
>   |-class PortRegion(IORegion)
> 
> Why is that strange?
> 
> Both, memory and ports have some kind of start address and length.

Ah, I was confusing IORegion with PortRegion. That structure makes
sense, of course.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72e26f0e-32f7-88fe-5138-9f35488b6b09%40siemens.com.
