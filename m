Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB2XD6LWAKGQEKFMBTPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E7FCFE39
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 17:57:30 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id y12sf4401626ljc.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 08:57:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550250; cv=pass;
        d=google.com; s=arc-20160816;
        b=XKeyqZkFQ8nbw1B7pCPxM4hFanIFdqE5scn7MfmqhFiINe35fpz6go/dME8SjfdvqG
         YbeuvDzEiez5W9/aYUsM/B9eLi/22zJrw2qYzmtWw5qm2I4qhg4I2PQcj9u2K44251BZ
         1om7UC1F5DcNaREX9B/hfZqLosoVsztXdYjnm3UKiMqxNekISAOadT9JbqDEME0th6qd
         +VeDOEm4HwBmqQqvJPVJNpcuNgVW9CXI0ACzWPV1nbN5DbRiEM4+eAx8bVLvFonS6wxb
         0dBpvyL2uN4KFnr3U016/4wkfRteJoQSgeChROKEGz7XFfgKUgmKhan7T97ChZaJ4b0j
         Up0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=Q+hesNTh1zYo99oLg6xJTH8bwQo2aFN9XgB0HMvp0Dw=;
        b=Kjzl03TIn8t8om7sI2UXtL9hc/XVOKz4v+Fm2/B3WjiJEm810DB2f7HFUzKGioDZiJ
         yopaSUl1Jhc2TXU8IQBQNzrH2RIBmhNdfo8WhkokRMIscOsTaYoS2NJxS47SZBDV32Ha
         5KAJfYsYNHiuTPUXTkFc0zwybm/4y0FArvm4kE9zeHcNKZABLrVmL/CpBMEVWycdd0pP
         xOjtNO9U5MDa+Eg3t4lqKWf9J0Ddfte1BGDP7ZKPhM5kRGo7m0Iq1D7NFcrsDrH/edeK
         x/tKzgRSHCnUaDrKF6+o9AKe2oK4CpaPCjwflHPl9cURh0SISVxtyfmeTSPEc96YYgQq
         Fkig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Bzj+LElZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q+hesNTh1zYo99oLg6xJTH8bwQo2aFN9XgB0HMvp0Dw=;
        b=QGFOmvsiU8VqSKlcrMEk4M+I0OcUaqMmDQQiJ5MIbINH2/mIRhVOfNrN3YbonXsRqO
         0qbwYrMWoi9EOXL8X+waQ0PKDLBxC44WmHZfdcbEE6Md2QegxB25H2+9cbmR9KekOKjE
         dyDZ3QSH/696m52FplhwPS7vuD5Dc4WLxnwg8mAWXaAiEbmqUloD2EF6AHeB8AwyY3Ks
         kvoytfHGBOCM/kYJWLjxoSieviQAUOh+P8yX6Y6bUHyolOOWsb3HeZvj/olAcBSszJQC
         7AeQlbcGQQHS//zJVHZHp49etgX/8Vb7GuA9mjs4KhIk9ollKjp3UqOvV7sIONrqV6Vw
         CaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q+hesNTh1zYo99oLg6xJTH8bwQo2aFN9XgB0HMvp0Dw=;
        b=RIj5VSBvUIh55hDZfxhBYjrsjEYHlpCXAnvdrX6PN3f/d6dL03p9U62ib23VMm27qZ
         BhcpQ3mxv/D0hIJ7tkRBgvDY/JkTRJLLushXVBGEkbEyuMG1KEtLBcdXlK7RLwm64HEj
         MgFUq2DoSeRYsKCUNok2KKfyg+uETcHFpsPb7j9sxdl8Q3VZ3kdbxgIyyYOEVE7Po2xF
         2m/cmtynfqJhZiRttFpjPL8FSGe/XvT67k36S3xmEg+7vbSm6yPXN2BgxVYTGOa9qt0w
         aFIgFg2WIDu+jbXIoNoU5sx7VQsti+itfQWk4zRt/9nFHUfVJ7aybZwf+4KXFem5LFOB
         jRNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVb6WtTxEuZqTAQarxfsCRlXn4qeq/YHlKAlHBs7j17FjUBuKp3
	gXyp+7zYmSk6Fc+7ib8LlMw=
X-Google-Smtp-Source: APXvYqxE27oSzZoFaMIbdcIH2lokEt023DLP44iFM8mgZ6j8E6vaS3BcR9BVPU4Om2KH8aZJ02TS4g==
X-Received: by 2002:a05:651c:1ae:: with SMTP id c14mr22885887ljn.169.1570550250496;
        Tue, 08 Oct 2019 08:57:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1043:: with SMTP id x3ls534162ljm.14.gmail; Tue, 08
 Oct 2019 08:57:29 -0700 (PDT)
X-Received: by 2002:a2e:8558:: with SMTP id u24mr16139576ljj.191.1570550249853;
        Tue, 08 Oct 2019 08:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550249; cv=none;
        d=google.com; s=arc-20160816;
        b=wew0g5NfMwHWWWeOoroiwTKYy/Ei7AWZzTGJcKCq4Y3Djq+G/gGsQDEXDBocijID+q
         lByeWRSaWe+eqpfbPkDV2O0ugcz3i0KdLJwefUl2Fv4KkSGuAZdYClQAJhUg/sSQqNzj
         O37gKV++/GUzyQWzxu27En520Gwq4SuxkgzNU/217pSlOyp8LNqISFySlN5Gt65Se3q7
         8g4ErmPU/+JV9GxdIS7or4p5Q5MlyTzCV3cAosUZl5a8dO9vpAMKUVh1NUmgJmxlrudq
         xyIcuJ+Zu7CxG1oS66bn9bxbYXxIRNTRnZNnW786l1Y1MrAX4J+B33tinqLXXaUbpNZS
         VETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=YBfyFhVmuYNt/F/V7YZEZFnWky4y2d2Q6FB0G9KSlHg=;
        b=vve+Jq1tGHfD8AxhtY0T96w1IPjhfS5T/bs43w06SeDA7L3L20jk7pzsZP00CGtiKw
         W7EXa5OrZzmmrmBSNpIFcWlhkj7c7bT75wlVIsYCrwu9qw0Qxjpjf6dQv76fSAi+Z2BY
         eGMEB9KpsGje9g29L+4mrOR39kR2bSaOvBCj6WGl3ji5rz6H32HIJph15t4vqbN/h3gI
         f4Z1vlc2TWM8VCs78JSupPvvpHgtyTge1YJd8NgsmMlJCoNjzCBO1ifOeVY2gdKCGkVX
         5lSWuEYulZCXcKg6sWbbB+PW58oaz3W/c2xS9bYUqV+uZ2SwpPLb86S7u5+mUDZQxc3R
         9iZw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Bzj+LElZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id u24si820641lfg.2.2019.10.08.08.57.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 08:57:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46nhnP1KyHzxnX;
	Tue,  8 Oct 2019 17:57:29 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 8 Oct 2019
 17:57:28 +0200
Subject: Re: [PATCH v3 12/14] pyjailhouse: sysfs_parser: abstract parts of
 MemRegion into IORegion
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
 <20190930193857.2866-4-andrej.utz@st.oth-regensburg.de>
 <f60ecdd7-c68f-b983-b9a0-a34d9ade36e2@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <348a790b-64db-405b-bfd8-e590043b3806@oth-regensburg.de>
Date: Tue, 8 Oct 2019 17:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f60ecdd7-c68f-b983-b9a0-a34d9ade36e2@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Bzj+LElZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 10/7/19 6:45 PM, Jan Kiszka wrote:
> On 30.09.19 21:38, Andrej Utz wrote:
>> This prepares for the refactor in following commits.
>>
>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>> ---
>>  pyjailhouse/sysfs_parser.py | 20 +++++++++++++++-----
>>  1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index 3027f82e..0f91d928 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -779,20 +779,30 @@ class PCIPCIBridge(PCIDevice):
>>          return (secondbus, subordinate)
>>  
>>  
>> -class MemRegion:
>> -    def __init__(self, start, stop, typestr, comments=None):
>> +class IORegion:
>> +    def __init__(self, start, stop, typestr):
> 
> No comments planned for IORegions?

Only MemRegions use comments.

> 
>>          self.start = start
>>          self.stop = stop
>>          self.typestr = typestr
>> +
>> +    def __str__(self):
>> +        return '%08x-%08x : %s' % (self.start, self.stop, self.typestr)
>> +
>> +    def size(self):
>> +        return int(self.stop - self.start)
>> +
>> +
>> +class MemRegion(IORegion):
> 
> A bit strange, this hierarchy. It may match technically but IORegion and
> MemRegion should rather have a common parent.

MemRegion and PortRegion have the common parent IORegion:

  class IORegion(object)
  |-class MemRegion(IORegion)
  |-class PortRegion(IORegion)

Why is that strange?

Both, memory and ports have some kind of start address and length.

  Ralf

> 
>> +    def __init__(self, start, stop, typestr, comments=None):
>> +        super(MemRegion, self).__init__(start, stop, typestr)
>>          self.comments = comments or []
>>  
>>      def __str__(self):
>> -        return 'MemRegion: %08x-%08x : %s' % \
>> -            (self.start, self.stop, self.typestr)
>> +        return 'MemRegion: %s' % super(MemRegion, self).__str__()
>>  
>>      def size(self):
>>          # round up to full PAGE_SIZE
>> -        return int((self.stop - self.start + 0xfff) / 0x1000) * 0x1000
>> +        return int((super(MemRegion, self).size() + 0xfff) / 0x1000) * 0x1000
>>  
>>      def flagstr(self, p=''):
>>          if (
>>
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/348a790b-64db-405b-bfd8-e590043b3806%40oth-regensburg.de.
