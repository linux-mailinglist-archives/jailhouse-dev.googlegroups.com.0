Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUXM4XTAKGQE5Y6AYKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 155551B761
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 15:51:15 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id f4sf698532ljc.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 06:51:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557755474; cv=pass;
        d=google.com; s=arc-20160816;
        b=zH+KTw6EQ1VMYGOKXLwyeFzKI5yCT+fOi9ZFtXZ5VuSZkRtd/1xhhD2dSxKJOEgf8Y
         wRwQjuFS/4Ja3dhiIVJf1kcqY1RTqsSa+S6mXPa3PeIE5+ZP2oBGYtl6Jm29IElLhKUh
         gv1WswAkg7diev76XiNseBgu8NpN/eOo6POEv8C2eolhWbKxtdTOJ2AGc9j25+SkilrL
         OxlsJpCIOnuW/nz4dqdJpTTND7wAAytTnPs2TvsPSOKQq02WCT8/YkmoQWcSWQJzIYSQ
         uKIlPUdb/suucJ3CblZwNvQtljBiymu7r/yKapLaklYOlcyvcnXQ4h1tWG7m4bVs8Bcq
         Eh3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=eubBoRHZaH6KlMfH3DuoVI7u7MGJPS9qtvIcO6IlHJc=;
        b=kBybE9wEnnkpfXAIBMVH8Ni1/KWJLHDijL0XTRxCjAY2E8H10IKRC7msYc7Y/SR9yg
         hlv4WlvJfvy9XiDY723MWX8Nyge5tQfX0vna0plD/dod53VwOJdXKxRHFmC/u8841bYE
         t+lyz9srqm5jAEJekO4ooOYnaYPktoZE7iw7Sqi6lxmLQo/cHHEMWYgSZzjHOmFqtQvP
         KukogqsISfYT7KscRGcziP8yHKExDzuvlgtPffpwR/pbThbJaSo3OG/YWwOpprr+ya1I
         ifhKH4ZI5/vEwdv5K+3ZjcMl5ID87oXKk7HAEgxkE8wa8sZyhfBqs+gh6p0iS7CIfbeR
         vB7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=uu+MryQo;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eubBoRHZaH6KlMfH3DuoVI7u7MGJPS9qtvIcO6IlHJc=;
        b=bqbh/6FQmFSjwnN9trxIILNZqwj2+UqfDhcXPWPj0isNDMr8HBTmyhhywT/14DUWxv
         pNHy8pX57zWOQEuzZSW2Zaezd4NBgkpZ8DV3F54Fe0RA6yfNFXlpD0BnR3Yfv8RpucBb
         r5uZQd9RnCSnu0+rRKkVghBHNbSPzmKZS44bnqpVRajVDxZRQrPlpIK65VwjsKTlxucW
         WQaL6x7Z5N/XhvPdaH8Ic9vPxMr8mAdjc0tZnRzkhayLY6x1NL0XxIXXtVCHuDi0ibUL
         MxCk7tVrSFJXQgXDyTn5mARSAtaF1xHlF+BGJjPak+tU36R6ODK8rFpTafgd/0p0J5u7
         Hiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eubBoRHZaH6KlMfH3DuoVI7u7MGJPS9qtvIcO6IlHJc=;
        b=TcIT8MVuSp8bfLqIdmxUnrx9QPP0bB+g7eakvRcj3NClT36JdCe3abcKXg+1isesBK
         FwmW+eHxRwZL/iB9kRiWWzjbQHjEaWoNe6hlURaix1h9Ou4ghAMA0hy+8t/RuRAKN4ng
         qw3dq/zoLlTQeE45cnW1HdgTQGaeG1sacdLc0eJ5dnxil0IZPFKdC2WQQetth/ER57Dl
         fE6mw+F3fQo5kuuvOQ0cPB8cQsRfSQRHYNFmlC54KFFeM12JbxAW+mvk5kIf9bBTjHew
         tMQmNOcG8IBZ1ppeVJ8jMK2h0ASm1KCqOn9MwxjQfBt0qAQgblLhn7vEtgZk/DVYDhvV
         HAdQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXu5YD5Xh5JxTVmTQTNul3flRG3w2VlgAg0dRyVLWr5IUhy2G8d
	enR6j2o5FmS1FO86muAA9fw=
X-Google-Smtp-Source: APXvYqyUHNo1UYrMWBSCd+jO+1XZRSROqnk8Ct0uqqWzvDdIK8qKBsZjWrNkfnPReadcr6t9FByRgw==
X-Received: by 2002:ac2:4919:: with SMTP id n25mr805927lfi.114.1557755474617;
        Mon, 13 May 2019 06:51:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:494e:: with SMTP id o14ls1159336lfi.4.gmail; Mon, 13 May
 2019 06:51:14 -0700 (PDT)
X-Received: by 2002:ac2:533c:: with SMTP id f28mr1111639lfh.81.1557755474124;
        Mon, 13 May 2019 06:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557755474; cv=none;
        d=google.com; s=arc-20160816;
        b=EzU+vpkAtWhKhHWWJvTvYA0LXHTJ+uBQhoFTBjfCc6k409KweuSpbxR1F8CsfNjgtw
         sWkKWSylDDTV6XfbYGnS7D2GblIYEbUUHX/5kHfGiOeS4ThJ/CQjzCBzuZKt/h5++ncs
         cMA3TmRsVD+3m9PIRz17lmM5pS21EhmXiLYuH2XJRtTuhXLC0iuYTt4BVR7X+e9X0Amf
         /QQJY3Utf/4VD31LQDOSwI6d5rNf1eBBrabLtmZhnX4ca30DQlOa+/O3WkyUnC55Huur
         RMYm/uEXZ03wV80Tl7z8bRTdC7upgJ2DozLnF9N5tY3jERXdenRjAd5aRlUvjgnN4m2P
         ei7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=nXZdNR1oMgYMyOskypVjlVJ+aeIUyAvnsgp7t0xuR08=;
        b=pPMJscunRE+1cSrVBJjNIyPZXEKfFtyzEwGoeJqsoTMQ/6vvPC0fm6R5afc7Nvvuuj
         zIVOEPx9fUUVXfW/bADxdTcgKYOwzUh8I9fWpP+oTXPJpSUGhu0RC7qqRzxpd6Enf+B7
         vlyXdN8ySG89vFcVjlpNp1CaSBXn32NHqPqDqtDgc2pVWnQScq22hCtu8sIcAYoOQGKu
         470g10pNkI8ktC7fdmcdaqumAyJmgQ0myG5ZDKGAQ/63neoy/OEM3gj/N1kkB+l/JRaq
         /+VrN9PKQJXlt3Sjuq92NO8oYJDfkgxMLqUeYOVmrO9NCtJgkGE2QUIT4C6it69YPQkP
         f67Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=uu+MryQo;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id j7si2792905ljc.0.2019.05.13.06.51.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 06:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 452j01047zzyBK;
	Mon, 13 May 2019 15:51:13 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 May
 2019 15:51:12 +0200
Subject: Re: [RFC PATCH 4/4] inmates: x86: activate SSE
To: Jan Kiszka <jan.kiszka@web.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
 <20190509210726.23168-5-ralf.ramsauer@oth-regensburg.de>
 <9e20c6a4-6e91-a547-8040-1e9fbd9614cd@web.de>
 <9f486f2e-b7a1-eadb-3c20-2a70e6422061@oth-regensburg.de>
 <96585c2a-3014-0791-e2d9-25709d4c8c1e@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <6227a9be-f49e-a0f7-abb6-267a4947d386@oth-regensburg.de>
Date: Mon, 13 May 2019 15:51:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <96585c2a-3014-0791-e2d9-25709d4c8c1e@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=uu+MryQo;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi,

On 5/13/19 7:37 AM, Jan Kiszka wrote:
> On 12.05.19 22:37, Ralf Ramsauer wrote:
>> On 5/12/19 12:01 PM, Jan Kiszka wrote:
>>> On 09.05.19 23:07, Ralf Ramsauer wrote:
>>>> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
>>>> hex2str or cmdline_parse routines). Inmates aren't able to execute
>>>> those
>>>> instructions as SSE is not enabled and will crash.
>>>
>>> Actually, this not only fixes automatically injected SSE instructions,
>>> it also
>>> enables their broader usage, specifically when doing floating point
>>> stuff. We
>>> should add a test or demo case for that.
>>
>> Ok, should be easy to find some reasonable test cases.
>>
>> BTW: How should we handle SSE/AVX exceptions? They're currently not
>> catched and disabled.
>>
> 
> That depends on a general exception handling infrastructure. I started
> to look
> into that, but it takes more than a few additional lines. I would leave
> that
> topic aside for now.
> 
>>>
>>> I addition, I would like to see AVX activated as well, where available.
>>> For that
>>> we also need to enable the corresponding bits in XCR0.
>>
>> Will have a look at that.

Enabling AVX is a bit more tricky:

We first need to check if XCR registers are available via cpuid. Then we
need to activate XGETBV/XSAVEBV instructions via CR4.

But we don't know which bits inside XCR0 are actually valid. This is why
we need yet another cpuid check. Then we can finally activate AVX via XCR0.

But there's more: SSE4.1, SSE4.2, SSSE3, or even more sophisticated AVX
extensions (extended AVX, AVX2, ...) may still remain unactivated. (and
what about 3dnow? :-) )

What I'm trying to say: We should probably try to activate most things.
 Having a test-demo inmate in mind, we need some cpu-local indicators
that tell us which extensions are available and can be tested -- we must
not run tests which we can't run. Again, a bit more logic.

My current implementation activates SSE in assembly. I can of course
implement the whole SSE/AVX-fun in assembly, but it is probably easier
to shift this to C-side (at least for AVX).

We just need to make sure that the compiler won't use instructions that
aren't allowed at that moment. But that shouldn't happen as the logic is
primitive bit manipulation, together with some cpuids or control
register accesses. Nothing special, but C-language might help us to keep
things readable and structured.

We need to do this very early (on each CPU), maybe even before having an
intact stack. But that's possible if we keep the frame naked, as we do
in the hypervisor at some places.

What do you think about this?

>>
>> One last thing: is it okay to just stop the inmate if discovery fails,
>> or should we set an appropriate cell state in the commregion before?
>>
> 
> Hmm, maybe we should actually make that non-fatal. The user could decide to
> inject compiler flags that will prevent SSE usage, and then we should
> not block
> in the startup. At the same time, not signaling the reason of a stop is
> not very
> handy either.

Ack. But see above, we need at least some cpu-local flags that indicate
availability of features on C-side.

Thanks

  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6227a9be-f49e-a0f7-abb6-267a4947d386%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
