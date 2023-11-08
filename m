Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBD5HV2VAMGQE7GUGBAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9067E5829
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Nov 2023 14:56:33 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id 4fb4d7f45d1cf-53df4385dccsf5532559a12.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Nov 2023 05:56:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1699451792; cv=pass;
        d=google.com; s=arc-20160816;
        b=cfQVY0lgSJyxject4Qz9ZY3X6T34jX3r1lNBgg6EcFCerp0/RkJsIUwnkX8Rus++Sc
         uo4XA2fSLBE8XrittqWgrKSdWYjE9KVqQLb/DWjrFWsXDngTbjPAj6phzydUfkqdPiaa
         4OcKZnowrpO2fw+qZAXIHq/hVixBjwzIlyJJXdUPrA3XNAgqaYxwKyRMZ67PRC9KiRTD
         jUZSPR3EoLvfqdGo46sv79FDI6Cod4UKGdE6X/nrm5o5qiee/rpZ+2PyV4Xhi21ZWIBQ
         +vK+CWTFI+ojB0jJDAZOAdHbHwEszJl9XfeRqUPyKBPHlevhpAdsfP0ZlzF9W8tLqPOM
         54CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=orVmW2aip4dlxyqU0XCH5JDqjgvOL3bdXdNPnVTNVYk=;
        fh=HyCuoSZT1Boat0rJHkEmYcyLjZ0hbalVuyDXeHe8ims=;
        b=Vi5xXGfIdv4e+TsaL4NXW5PRQzw3TRC6DEPaqzXyd1Zff5cyo38FbBFOCNsNQIEUv8
         ukkhKEdrpxWWNMlLgUFEUFdiQnYjKZqh4G2e+mqTys8aRyZp79KPHEhaVxhk4lLfT3+Q
         tTjEMrlDpPmapwIdigwILLkzuiVPGyKnGK2gFQw/spCVSG1fCZNAokGZjbKyWj+m1cIV
         2IDZrfdEwQTEne3r649ODcI+H7spc2iNF5GNpoCt7HQq4Ntfx7HUMCtIccNCPfagm2/2
         tdbzYBwGtFikQPUnuz67WIeTSXCkINWAVayO9dZkg9336ByuPvGyPxDYiQ0aM7p8TEmL
         NLEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=Ut6li3wJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699451792; x=1700056592; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=orVmW2aip4dlxyqU0XCH5JDqjgvOL3bdXdNPnVTNVYk=;
        b=iwQfJeV9yLtBqfVYdnbW0Iq+398aISLPd88gk/oGNaJVnpQ9EHP55W19V6TVN3aSKY
         s9nP+DJduQikwxS9FnIhMdXOphZyRytRZMoZBRXE0ZOxkc4pWnfHIQIFyqPj9GZK4jGZ
         UPGNAr8t/3Pa4JKAy5AUT77DfrLJOaRJzmPUncqbH++Xt/lZkkRWd+KDfNPC1xJ28BJ0
         8Zq8SJeASGmyV0Gl83ftHPzW4Ql26DgQR05YeTuOp3AcPM3GIuK1XCwV0PEKLZQy2kv8
         zu8UZrSS0mm0Jc96+eH58eMXfn+gnZiVr7bmk/gbMfWnKK9gZSF/FvaFFQhFkZt5tKdX
         cqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451792; x=1700056592;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orVmW2aip4dlxyqU0XCH5JDqjgvOL3bdXdNPnVTNVYk=;
        b=Qg1HJKhp8mUIS8+pFN9Glm/vp/lsEOiIxQgEv6e7Y2E0HEllPXCAhet5lWlurEY9K7
         8pxDZpLgRdVKmmX5N8EWn1+pnfCPxTAjuFnu8u6Jr7toIpIHzABs9j9dz4lf3mf/4pKk
         yWLPCfg6Vu93EoXy71r/OOSYIxvVgPWF6+z3WaoOvhp6jIRMozLyXPTQDx0W4uGsqQEj
         Mmxuj8ZrCqOGmnz5MVDoML78lNmgzKZpFg28E4ar2O72cpkbpm9O9APtKsc9NkUdVbEQ
         ybxr9rANTuavsEtmCUNiQ6IWfS5LMDNzD66YuStZMZHiKt9oO/Jby2O2xhewc1eaPGzy
         7Qlg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzFBjl8X5/OHkf6C8MPUoG0GKHAZ+EQqkLFFD3SBEgFVaBZ9CbS
	3GN41B9wXXSENJs7hcIoqiA=
X-Google-Smtp-Source: AGHT+IFoqPs7ZSg/WnZmNtJjOQdCKSWdcD5YP7f0gM3sid4oDXBerYqf82JCi5jVqrmi1pJagO5xFg==
X-Received: by 2002:a50:bae4:0:b0:53d:d913:d3cb with SMTP id x91-20020a50bae4000000b0053dd913d3cbmr1715022ede.28.1699451792428;
        Wed, 08 Nov 2023 05:56:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:df17:0:b0:543:7aea:f48a with SMTP id c23-20020aa7df17000000b005437aeaf48als425091edy.2.-pod-prod-09-eu;
 Wed, 08 Nov 2023 05:56:30 -0800 (PST)
X-Received: by 2002:a50:d092:0:b0:53e:323a:274f with SMTP id v18-20020a50d092000000b0053e323a274fmr1452487edd.42.1699451789762;
        Wed, 08 Nov 2023 05:56:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699451789; cv=none;
        d=google.com; s=arc-20160816;
        b=egjDdY+K9EcSkn29ugkKt1jis4g0zOHlGuUZHKWS5d507AnwI/YgbARmYwi+wyTjvN
         b7KPq08FIsbaUOZxmQ+yDXlXf+u88af9UfexzeScAB7kWpr6UHOcR8p/pjYmNNTnJXce
         wjx1Dr06QGsbN7iWK/uhFZG2oa7ixIn+xpLJ9xvNVzsub2EGNMF6FK0d/B8bDTgS5pCI
         1GkpwP0id05Ygu+8L4Fe+Dmh0ykQ7eezDVz030UtPfSaKY2+BtuSdWGOZ1YOziMZ5nsP
         GfGOsXdVy3OUaUXBn7WI/Xu08ecVx7lrRlQqeuNz6L1ATWIaXACJ3ayVAS3KxT1NQVrp
         O1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HH3yMgZhTaaA9BPYfbTMi9b3UYxXnhEpRW47/4ixslo=;
        fh=HyCuoSZT1Boat0rJHkEmYcyLjZ0hbalVuyDXeHe8ims=;
        b=UI++BrXlMExP1DZDiEHzZAgO2jYP6j6ICH8xvE1aCfgpQSKdElXPoWSq9iiMpfVmni
         ofMYBD65O7Qhjm2BlHV5BtFZCJmvWkJ5PF/BLlPdSlybJnuhRzMwU8Lzk+B0VlrXVMRE
         kDqJl5K10Ic06ZqD0rlrx6j1L7bS6AvYc+dfubYAUis+s+d8qWtulWXwQTpd/WR2nZnX
         U8iesIbQDjATd0P+yqZv/pcK5ML4i7amaZJOm+hi2wH46HcJ/fNoEl8/7qEBm1pq7VkL
         s+O4fmGEqDAtmT0yh6WilBi8C2KnrpGsKXeZsz3d07NOBnFdji/W3qo9VFwNYz2ZuYj3
         ig4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=Ut6li3wJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id a20-20020aa7d914000000b00542da7908e0si784338edr.2.2023.11.08.05.56.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:56:29 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [194.95.104.13])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id CF5262A015A;
	Wed,  8 Nov 2023 14:56:28 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4SQRT84R5lzxqs;
	Wed,  8 Nov 2023 14:56:28 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 8 Nov
 2023 14:56:28 +0100
Message-ID: <493f2502-4a97-4421-86c3-ce366b00496b@oth-regensburg.de>
Date: Wed, 8 Nov 2023 14:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to display xil_printf or printf in jailhouse?
To: Tony <antonydellerario@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <187937f5-9346-485b-b2f1-8a7d78ac2768n@googlegroups.com>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <187937f5-9346-485b-b2f1-8a7d78ac2768n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=Ut6li3wJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Tony,

On 06/11/2023 12:06, Tony wrote:
> Hello everyone.
> I am trying to load a binary as a non-root cell of Jailhouse and run it=
=20
> on the Ultrascale ZCU104. =C2=A0Within this binary there are serial print=
s=20
> executed via xil_printf that I do not see in output when I run the=20
> binary on jailhouse. I think because jailhouse does not support the=20
> libraries required by xil_printf, such as the printf libraries. In fact,=
=20
> the default demos (gic-demo and uart-demo) print via printk. How can I=20
> solve so that I can be able to see something output on the serial from=20
> my binary, without necessarily including the printk's within my binary?=
=20
> Thank you all in advance.

I guess you're using vitis? There's no compatibility with vitis.

   Ralf

>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/187937f5-9346-485b-b2f1-8=
a7d78ac2768n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/187937f5-9346-485b-b2f1-8a7d78ac2768n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/493f2502-4a97-4421-86c3-ce366b00496b%40oth-regensburg.de.
