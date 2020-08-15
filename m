Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB4WY334QKGQEZWJWKPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF1F2450CD
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 11:35:47 +0200 (CEST)
Received: by mail-ej1-x63d.google.com with SMTP id m18sf4099330ejl.5
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 02:35:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597484146; cv=pass;
        d=google.com; s=arc-20160816;
        b=fgXYO5YSSkKSAh4S4JFsai2S38Y1UPbHkJeWaXIkb0EkLSWvis3qrTuGexeqEiE1CQ
         Ma2dnaHOBQLHaYUEHneo4MlY4EdQLRjGCyEBBxJht/NgBlv2htsmA0PEJhSlpLcNnZG3
         QdUC83OK4MMUsCXhNyJA64Ue/RtD4Kbw0h6LkBlN5/UD+k3iEiE47g+Q7hj4dD68J7Cj
         o/Nc1f6T2FCU8YiLIbeRs8sbrHEEDI9Z8tJBbOiax80t4jtXqQNcKRTE2nUG+G9v/Y7P
         hDWaikRgnDHa98K1SC65bQLkG/8yafujBFGXZUga0te2cN/0aE8AVErByqZek9MIHoAU
         g2IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=JfIfV0SwyZ2lxci1y4LFfNYj6l/WiF8h+o27S62Ms8M=;
        b=t21yTkxUztDLVadvtKOw51SqRgwK95x6AkuHBryNS3zKUK4EC5F3LhbGe4SGW6v3n7
         MlxwG/+gNs29h+kT1bnScnEou470dOJShoahnAdb+A/Z/OCuvgnTLFbYv+XzT5P0G+69
         3sQF0UUnpq8m99BDBfa6yHrPEKTF4uTqoVwBeYwO67TnKPipaxtVB9xhNH3QmKCPdz8t
         RtHSLfVp7ocTHPGA1W52OoJdASvxMW3oRMul3vLkuk3gwbDIVNyDS04zSyF+kv4Z9lMK
         UcnFaqu1cErcT6099WkJZeQYww6Ccjd17Wq+vtDYB2TXbGkPfuL6fJMTqFfMV1C5Lsqm
         9y2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hWJ5Cpza;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JfIfV0SwyZ2lxci1y4LFfNYj6l/WiF8h+o27S62Ms8M=;
        b=OPaDWMTAydWPqFdv2ZfSvGWoBW+kcHK79wN6kdumoJCDUcKv3OqyXCPnA4lXAqnA3W
         X5oYltzVWcV748jnt8RzlGdeyAAqJEnHItspltyH1YuOxIBW8R7SNJ3V5w0mj8CZ+WsK
         LBA+54Mfl3h1aZ2VS6THh5ofn+6xN2WUVu/Ms48zOW6lVyw6xLlHBjR2yNXBjo8W0neZ
         ZwcyMJvhY3tM5RXnzbxbhmsftDNTFS9aD9hvyChRBRXm3hvwwVOT5sBn5wmjfjFXvgTR
         7dbVWCjKgImT2+UnmTqhE64Y+iZQD6lu33gtuZFZNkDB7YxaIS4nQJM/iONVZY8Y/0kj
         Prtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JfIfV0SwyZ2lxci1y4LFfNYj6l/WiF8h+o27S62Ms8M=;
        b=o5NIHhivRZMYWzbRp6r9oz3yYrbbWLakpQi80Sie7NzOFYTKylX73vtQbw88ac5BxR
         /ejZ2BKlr2p1ymoUzEzRPBOSxxgfKewR4evI4UUSUHI3FBKQ/Z24gymwTpBe9H03vpfk
         pjAI5rK7ZCqDOI/eYJ5Agfipxx99e8A0azJKVkH/PCDp9tou2FhIgaclBoRB+An/hKN/
         3VWYrdRmBoqgCjhwaMcDeQ0zA1FK98gme7YoVV4u3jv7Ny8xDgZe1JcfuEYlqBpsheIm
         1TAykXgLov3hKe0qqfxqq3RgPtkrPXaXGsQaLQh0EzG0KaZD+Go3+Yfm8plrMJtZHfP+
         3TVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532mKAnnOY6voGwDWsORMSjLZnT3K/90ZjodL7Wx/KrpcRZnSJJK
	l3ejCbgIfcwUpvj2MVhE6/g=
X-Google-Smtp-Source: ABdhPJyRdKDj0E2d+Ryx9CnTPiaX1UqALfgKyYcxTzKorrksvfAJOl68Ws44VsyNWsoRvrlWiJtQIA==
X-Received: by 2002:a17:906:3493:: with SMTP id g19mr6575949ejb.253.1597484146693;
        Sat, 15 Aug 2020 02:35:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3b1b:: with SMTP id g27ls5448486ejf.0.gmail; Sat, 15
 Aug 2020 02:35:46 -0700 (PDT)
X-Received: by 2002:a17:906:938f:: with SMTP id l15mr6612051ejx.539.1597484145911;
        Sat, 15 Aug 2020 02:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597484145; cv=none;
        d=google.com; s=arc-20160816;
        b=NFFWh5SbiY9jlR4eHzNdtbWN2Zona/sLnWMArk9Y8Yaf4HYj4lUmbGfuznbIT2Q/y9
         0PXPPXU1us8ncvY2iJ6NjiOaf0nyb1mrZIeDKxivt2uyl68iq9fh3hu+3TBzHedOIHGC
         FpqzYdAQrawEpTX424PwM8J8zYA+47HDDUNGfGei7jAJcJHk7hpbi9TywNgRpCaHGqOX
         QUZ9zd+HMzbhDxY87xoRLU5mrlL6nZ7+fs2NUXNGF+BBXRqb9W1Bi/setVNxpY8qsPa6
         xGnkh8M92WuVObH37W5bO4VJS0yxfu4ImtSDRAhrtWpIVyePlX4oNMUdboT2itPyMcwY
         qXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=LRbinuiUl6ozYmllQd2zrtHUVSbTYVIIi+9XYnpxkTo=;
        b=Ua5PFgN+L52vbcbPx1bCVckJq4moH8tr0UGHHB7OKRFsxaBd7jAtffouwjM0HdUZ+4
         s3LHcyDbY9rkdlDaL33WZYzHUVYvS/liZyrIcYZBUPAKZ5+5WaIIRBQwXQPqwudqFgVe
         IEeMr5Ww3b5m9XPWlRhN9WdzZ+7wBVeHB4G5C43tptL1wOGnor2+GOp8GqXYQJLAscG4
         QwrvUNI9I6EzZNhQds5Zgrqz+c7Re/fSds/vih/0Rf3Ru0LgeTPv3htE19yhb2rsZZGd
         ejOSGVvnJ02h9yftSwoeIQHJzXmx5Rh2I8jTVnEdc58LSm5sEhSQxYdExWiAVRC15ODu
         KL2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hWJ5Cpza;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id t30si453832edi.3.2020.08.15.02.35.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 02:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MKr7w-1k6sbJ17OS-0000dy; Sat, 15
 Aug 2020 11:35:45 +0200
Subject: Re: Dropping code during runtime
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 Alice Guo <alice.guo@nxp.com>,
 Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
 <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
 <4f2c2e19-eba7-6020-5f1c-137f9e8c5efe@siemens.com>
 <314fbb96-7032-ee8f-8926-de3a667bddee@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <fe0d27f0-cb8b-871e-c8e8-c898e4436570@web.de>
Date: Sat, 15 Aug 2020 11:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <314fbb96-7032-ee8f-8926-de3a667bddee@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:lkW2Iv8D54m/VI9qtOf0TgKU6gGh136J/2+/tuCTF46SyhoRVjC
 GZZV8M4GRMt/+rnm/6JL3FZtZ7c6Tr2C8Vea8YFej+jH0uh62Mj9gFcDgufHVDu2/B4eHq5
 eLBjFN1NkXzuleJTvJSWg+3NkGlyU8x2SgU97A+QDbUXtQpAfR9oRH/o2a8MdboyVYjO7TS
 YvLLBkb3UMmhr3/eT7FMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JXbwYjI//9s=:r6wsPnltoOFgSVkT7AA9Jt
 dWKo8XzYfXfb8Y1190oeEKldT8kZu63Zg2jXx7w9KBJ6/kFEYe2Gm7WOjH5q40NcVtmCoQNoU
 h0Zgr7rXBclQT3eFzgImD1RZmob5J2T/X4X8cuW2dqC6fnaCtGeENxiOVtMW8bqDU9q77I2+n
 1vdylJMjszrZq9X4BYSxTFkQdBdcYHJifE6V/vav2uS4CHD5QtVa8YinFSWr1Q1QjsttJgBiz
 8EOxtnIGA3eo9N1rhXaCw+yqb4Af5NOHujfQMUCKnmjx9nRop3qJN0r4SF+tddYbj1tV5TBd1
 7UGwIyLC696T6eW8ZJc8pbqRoBafTi5hQaazVItLMZVQr4Xivy5SZ77uoe+Z/qC5Im23i4ku5
 4/PtmZHXS/NLq7vg7+yjJraqzUssdCdSEAs08UNTnKKau6WIrEcPT4CGTMvqfcdu4GoRKsVkB
 etViq7CecqaV08iJ7Ug2epvK/NiSWuVBycmqxedIlVF6d+3DbtLU7Jw2A1uY2llotxEz5ZKRl
 yHzbnpW6Ap9cb3p7KwRqzJHGes7ULHfrhHZf06SSE+ar0KsFZ3nPts/AQgBg/5rCzyZChandf
 uBnDRbKbxyUzgf87Lk4JiSHdKhm4QNQA0kjMLsPYCO1r3+OBB+cRjeb7WttBYlcKvqmlRnlyy
 8Z9K8Bp4RyK8+jwghLb1naDgTcoji+UUBEzcfvqwViDK7PbtcyFg9mmSaUvTYcwiQpjR/6Jjb
 JAScgYJ+pEFheGgB6Rn9oS7Qt+sm1eDDlWHvySG4DbO7xqK2Rw2Z65w7uFstzFVygqwT2iPTS
 TAvkMFz0p2Grv8kN0JKJEMZOHnRlYqB0Gw1aZ/a6cuE30NSmLDBFXgTkb8a+7V2W+Ui2af0fu
 SZYypHCJmC8sHhRwjVTF2kmdpuEButT/hHYA6L9xQfiGsRcBgvi6eBpn2wO0jTO2Oqj1aqvL7
 19QFA9NRwpgjCkwo0IFzzrcoWFrO0jo54JVDY+7xNah0EijFrv8LsSK1xb+Vo4+XRcnt81vwD
 FSIxuZBPMzYR1jZgeKXuFWUQZ0Z2EqKAdFKcWdPAvDn+C1wIjm975KZEa9lDiEfmbu1Z1mrJV
 fecnNoCmuejZhS0QF/BhT7v6bIeOUCoMr2xGWKelVsosRmLJHMTgabGH2p/lVBU+OZw6B3itm
 1km5u2IaUUN18e0b6k49JBUpne3RTawXmSAF1/nMJXTkw4TbWOGHQK7sbyfpmQjmMOVvJSVAE
 z4uoPfbIxCcjErK16Gyg59vunqHe/tzDl6hW2IQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=hWJ5Cpza;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 15.08.20 03:31, Ralf Ramsauer wrote:
> On 8/14/20 8:13 PM, Jan Kiszka wrote:
>>>
>>> If we have a universal binary, there will be a jailhouse disable will be
>>> present in the beginning. Once we decide freeze the configuration, drop
>>> it. If we make those things compile-time configurable, then it has
>>> potential to become a variant hell.
>>
>> Dropping significant code chunks from a root-less jailhouse.bin would be
>> a valuable reason for such a config variant. You do not have to argue
>> over things that are provably not there.
>
> With my approach, things are (provably) not there in the operative
> phase. It depends when you want to attest your system. In the same way,
> you could also argue that Linux, U-boot, the firmware, whatever has been
> there before you made your attest.
>
> What are the parts you could drop during compile time?
> For system partitioning / cell creation, you definitely need to execute
> the code at least once - you can not drop it during compile time.
>
> But after execution, you can drop it. In the same way, you can drop
> init_early, ... and others. The only part that you could drop during
> compile time would probably be the whole disabling logic.
>
>
> Let me try to show what I had in mind:
>
> https://github.com/lfd/jailhouse/tree/detention/rfc
>
> That's a very early hack of what I was thinking about. The idea is as
> follows: Simply lock access to the hypercall subsystem, after the new
> detention hypercall was issued. With this, we can remove everything,
> that is only reachable from the interface. Runs on Qemu.
>
> For the Intel version of the hypervisor, before that patch, the .text
> section contained 48182 bytes, with that patch, 40616 byte remain in
> .text, the rest can be dropped. 16% less assembly, and I'm sure we can
> find way more routines that can be annotated: init stuff, pagers, ...

That's a first step, but I'm sure much more can be done when there is no
concept of a root cell in the first place. It means, e.g., that cell
creation would try to stealing from a root cell anymore. All that code
would not be there in the first place.

My approach to this would be aggressively hacking all unneeded code (and
data) away and then look for how to encapsulate that removal best for
the classic Jailhouse use case. We could still decide afterwards if
there is a way to have it run-time dropped, but I'm almost sure that the
safety case will benefit a lot for build-time dropping option. So this
will come as well.

>
> Ah by the way, what I realised during my experiments: The .text section
> of Jailhouse is RW mapped. I wondered that I didn't receive an exception
> when I tried to overwrite code. Is that intended?
>

I don't recall any code-patching right now, so we can likely make that
read-only. It was just simpler to handle the whole hypervisor blob as
one thing. If we start coloring the hypervisor, possibly replicating the
text section into each color, the extra section identification logic
would likely come for free.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fe0d27f0-cb8b-871e-c8e8-c898e4436570%40web.de.
