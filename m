Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBSMK4TTAKGQE6Q24YRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id D88141B00F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 07:48:57 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id q2sf1735245lff.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 22:48:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557726537; cv=pass;
        d=google.com; s=arc-20160816;
        b=a7y+CEOS9C7Zs/vgsQjjnl5tgQCgUWqxWiStHkPtHvNbNktc3w1q0vt+v8ZNoUdbYa
         3o+rZp5/sHPHc2xQVVM1kEqF0KpMyiA8qrc7LKheQKT3BfFSDxVwqWxtqOBLFa3gzRRB
         vEnku6/KpQEB8cch7WCSQb/Ycj16KJQ4IgupicvEzjkdiNihVu5gB8L4GAjmuyt2Pe8L
         igSOfSNP+8wuDJRQ1fO6YXME4q0yx0xeA1bD8S7cxMVOvXrC1NzwpgUC3OTnAZDq0Gak
         j+hCtQKX+aPF+RQNq9hjEnFyfUY6tx3Ex09N3pAdAXccbHq114tM0AlLjaks4n9AENFV
         tAFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=oWxgd6x/4ix7I8S3QEYbAvzZ4EG0gOjP1XsXSPETb1M=;
        b=ZvPURTrcGlu75VVD+58lfvPezgr6mckCInKb83XGEYO/9tw1zl+vb6GCOlm9Jc8yU2
         rUuyR6BaNNAguSehG9gP2QxNgdV59ceEydUTB8hYqaOHG/r3WsAEiMpb2Ot98vxqDzLa
         Dars76ff3PxcfirxO47EAn+iDktzThie/4ovK1sxuP69ju8zdc8Nv7c/adegEcIUM6ka
         PzVdyQaY6Y/YlimSMEXp0MTkRfO652EnjNQ5xZ7C6s3Nq5pV+ZUv7in/BVecKPIv0qIP
         ZCUGTKOLtPdPWM3WyKHKtgGcWx9QQKq4hgorQkFvnSeHHEgx/bqMhKQZQ+KM8MBh5AkE
         6vvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pVi1W0Uc;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oWxgd6x/4ix7I8S3QEYbAvzZ4EG0gOjP1XsXSPETb1M=;
        b=Db50zJqUgpURtLIrGr+JehXna9NGRVKQhH81HeFSyxGQJQLUYBuQTqg5RnoEZ3+j9I
         /TQxhJtF/9PXGYPcri0H7rcidC1HUF+wdoqG+vpuTZykHcUQbyRVxiaF9qrpOdH5rWJn
         ww5hGqbYkNLP25T0GUT6VcQo/qPYbW8zmXdqq7h9ZPY8ds8WSF7Td1H3EGV47PsCo0N1
         pKFqWTvMGP2oOuBz0/QgBoezvuGqbIy6VC37XWcC9cyFympXrKbdpqfDusQJojQKibO9
         kGgDRu5o5uKfWD1hVxqIq8T5/UoMzAxPqQSC2ypoIVGwg/WmfmKSO81wlN98feaivBeY
         9l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oWxgd6x/4ix7I8S3QEYbAvzZ4EG0gOjP1XsXSPETb1M=;
        b=VKJsD1iNWKiRcrUu+0cTveuMdkUdSudo9TA/BPgetkxCYdDdh/Hu3TcagjjE3pGqSC
         4Ixe5SOPrXp+DO31eno/32va6iXxL0I3AJLGfFMOMB8BPJxlk0gX5dt82zhNSMETNbzM
         XAhGQ4EyJEejT5eLpboC3abX5drNeGo6d6f1eQTt1SjN1jYpBs1OOvIvcEzANodtTOG5
         1VIxS8DPYh8d2UWsTDjK8C9L/jj/O2NerkGWvgi+YRYFidDj3qNo9pEgxghYPu/b4EkA
         GK49ay/EZAhu0x4zT9IZagKJlFwZK4Y4Ozis/IUApehQJBHZRy/o0XHsmkS6a4ROTiig
         cG5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUBrKPmI/q1tc/I/UCcItDn3+sfHLrBvbenSGfq5MRayjVRejGD
	aqrP7k+0JeKEawvvwGnfiJc=
X-Google-Smtp-Source: APXvYqzhbzaDGuk7ZjEb871jUtLKNtj+GIS5ULU/FD3vKrMqa+qWUkOXuuojK1DVsD6qou0420gt5g==
X-Received: by 2002:ac2:5626:: with SMTP id b6mr12215788lff.82.1557726537357;
        Sun, 12 May 2019 22:48:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ed03:: with SMTP id y3ls86353lfy.1.gmail; Sun, 12 May
 2019 22:48:56 -0700 (PDT)
X-Received: by 2002:a19:655a:: with SMTP id c26mr12935843lfj.97.1557726536864;
        Sun, 12 May 2019 22:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557726536; cv=none;
        d=google.com; s=arc-20160816;
        b=Kkq7m9bHSwg/vtS61KxxT0YWGYNNwuqkzHhWFBer1sv8lDnc4RY0xqtRepp+w9aL5M
         SRK4eu2snvEceC7DtyFvdrNAjXxyYMx5HrsJGF6tE73kVIXgGH6mDuX16ppSyou3Ydoh
         kP437SLpsqfyFrTfYv5XFA4oeVGBi8X5WSlw0IY3HTRBX4l0nXyceXkoRqNVm0qkOrXt
         e/q1QdPJtLRIRpOGsR3in9G6sBy6HVazlkdnqjXEqYTlI87g/MT3VD6ljQHYd5L5KVGN
         KkQ7t4MeGRRCdntjGwzJV6px/IRNTTHNU4ul1ozo24S0iKCxlkoMz0uo8VHte0FhGn84
         NITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Vy+n7h14oxR7Rti75N1i/xAN2en7gQyMGcOGOrzvNCA=;
        b=NoFQeBQpplx1fIEYm5/F9+Nin8KZQsITO5e54zIxWbm24yM+sUtd+osDx3aGwqUvYw
         TOMsjLFmVZDUUcSaWKEFtcteUggJgE5X3kxOf/EDfQn2Y5StwY9fwJJhoioE4TVritH7
         3OyUWw5J7IpLcBwYfwpo1H/0cCcfm1M+zPDmHZ141JC88sDItZ7lqR0uerBA8KFJWFih
         gXOdUvtXTmLdJnvPFvAh6N/NIWnIQL4XvC4No+AN7bbZQLlkj/F87V4fkd7DAEMNjaNB
         M57v/QrK9cV+4tJJqUxWKCBbn/OWNhX7P43zp/QgloZoriwTMZkVnJw3YQveDP3TAf4G
         +ZBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pVi1W0Uc;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id c22si2115444lfh.5.2019.05.12.22.48.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 22:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M9GJ0-1hYLpx1xPy-00Cep6; Mon, 13
 May 2019 07:48:55 +0200
Subject: Re: Running apic-demo trapfree without x2APIC
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Andrej Utz <andrej.utz@st.oth-regensburg.de>, jailhouse-dev@googlegroups.com
Cc: Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
References: <e5d2b706-ca42-9d07-3093-eb9ec547bf1c@st.oth-regensburg.de>
 <835ecb8b-3e0a-b90f-69d9-c240801d3b35@web.de>
 <c2c39459-478f-8adf-1b13-95af918c5c52@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <6a202fd4-2bc5-f262-057b-cad0d90c1f1e@web.de>
Date: Mon, 13 May 2019 07:48:54 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c2c39459-478f-8adf-1b13-95af918c5c52@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cy0lEPSL/pPzMjNnccUYTg/EB4ywQYN0nw7HqX9Mg+pIZH/2zxa
 DMis9B/fDvBP7Nlo3zQZjrL2nY/bcg0bfPauT4HeL3gx+xNtTmVEK2OQZ4Cc9ebRSaueXB8
 +AvkwjpIe8inVOiExxkMUIyWTr3/VjkRE2+//njgEB438ktzCORbYGM9JAjag9l1+zCfZjg
 /3KTWRyepkN8zb7tfLttA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x2Zq+OY/jhM=:86ZwrtRimLh04CsaF6o4jP
 eNA/Kpwx8mR0ZS2kpcKB0w8X/R3ekLSPNTxUvTH1AGmkaBGG77ngR11ygbHy3xqvBmyVRI++F
 uVn/roMDMWcCPiFTD/GbZOQqjgrTs5K6kbdVSTB+FnV+2gjpHxsiMkcKNZRMxeGXQeiHOHSWI
 4rP5oBa+Gtkbn/PGveL4rA3buoEWmTSFMNYyAAvi2Br+P3IHX5DAx/C0re8SuqDkelNd6E4Yf
 P1cy59yQvLqgfRkWUfadoIK9fumuvhq9C9lQoNqPy7ku6kIlJcUPDt8TjV0afQ2IGPbmTKGoc
 8ADQRFS/bRb+qCNXsBipTKdj0ghr89lCWIlYQTZ5U0R/2ZH2rydSojL6dW0MncC8l0YnLCW4B
 WimYrP70+h7Jzll2pZ30IyaUVQ3R88piq88QkXJ88JnY1Cd2Gk/JuPRdvqQ4qv9NFQLLPJy58
 DSicmzCO7OQift3N62aMmqubiurE+N5CMMKCYJmllhIC4FJr+0BmI71drmSP27mmdkcql4UfZ
 lcpxepdHSV2L/GLErjMPnmJn1QXaKJOHSjrhBHU34DW7D5CKKhxXPsK3jeo90lrvclMRoiTDS
 EYjTr4rOOMTWwc4r5Y7zFiN+kz4sHoPbo0j35Lfh/epxMg7F5wsS9+igIMSN7yNul85nZU+NP
 dpJTpunkrS6zLo5iEY1EJQ0C4TN12ORzrSvVhGpsqUyYpQekifIRLnUNKw2z2cpfsVBBzn8ly
 Jluzl12Y+Sj8kBcYgQ0eU1vsi1HeaEF0m7Mk9Egc7LH693QNA2JUODQIhpt4zcHgPUpKWKO6k
 d4cmxOg5zN1Qux2q2tzYIVRBqPYR78eS4kUDzxkQF5bVIzbl85fAEi8jIBeRrFbI4uSYxTtzz
 reEuPyWebIB8TbQiTwvFB1kpeKduFG1eq0MAQT1IZ/PGykM+NvFNaL0jZFvJY0uMrdOCbMy2P
 7AxHqvGLC1g==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=pVi1W0Uc;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

On 12.05.19 22:34, Ralf Ramsauer wrote:
> Hi,
>
> On 5/12/19 9:32 AM, Jan Kiszka wrote:
>> On 09.05.19 17:19, Andrej Utz wrote:
>>> Hello everyone,
>>>
>>> while working on Jailhouse to run on AMD Ryzen without obstacles, we
>>> observed
>>> high jitter (>1000 =C2=B5s; 40 MSR_OTHER traps/sec) with the apic-demo.=
 Our
>>> target
>>> comes with an AMD AVIC and does not implement x2APIC or tsc_deadline.
>>
>> 1 ms jitter sounds like power management. This can't be explained by a
>> hand full
>> of vmexits.
>
> Ack. We don't see such high latencies with jitterdebugger/cyclictest
> running in the root cell.
>
> Nevertheless, even if PM is involved, 1ms sounds a bit high. We didn't
> debug this deeper yet, but maybe there are some other odd things: The
> first timer interrupt fires with an 'okayish' latency, then it starts
> dropping.

If the CPU should not have something like ARAT and is affected by other cor=
es
going into deeper sleep states, it's not that unlikely. Do you see that
latencies also when the root cell is under full load?

>
>>
>>>
>>> The timer implementation in the inmate library will use x2APIC access
>>> methods
>>> which will be translated by JH into native xAPIC access.
>>>
>>> If we switch to native xAPIC access in apic-demo, would it still need
>>> hypervisor
>>> interception?
>>
>> Yes, because xAPIC is MMIO access that needs to be intercepted
>> completely in
>> order to filter out the sensitive accesses.
>
> ... And it's also not MSR access: I switched from x2apic mode in inmates
> to MMIO-based xapic access, didn't help. (besides shifting exit types
> from MSR to MMIO).
>
> BTW, Jailhouse always emulates x2apic for inmates, even there is no real
> platform support (as in our AMD case). What's the reason behind this?
>
> I guess it's simplicity, right? We would need to trap if we use xapic
> mode, and so we do with x2apic if it's not present. On the other hand,
> if it is backed by real hardware, we could save some traps on MSR-based
> x2apic accesses.

We didn't measure, specifically not will all the accelerations AMD is provi=
ding
for MMIO interception, but I would still expect MSR access emulation to be
faster. Moreover, it allowed us to only implement MSR-based APIC access in =
the
inmates.

>
>>
>>>
>>> Also how far is AVIC from being usable?
>>
>> IIRC, it was implemented but didn't work as expected in all cases.
>> That's why
>> it's still off.
>>
>> I do not remember, though, what exists it can avoid. With AVIC on, some
>> of the
>> xAPIC accesses should be handled directly by SVM. But one question is if
>> APIC
>> timer interrupts could be generated natively - I would guess not.
>
> Raises the question if there exist native AVIC timers that can be used
> without moderation. But that would require software support.

Just read the newest version of the AMD spec on that. The bad news is that =
timer
accesses and - to my current understanding - even timer interrupt injection=
s are
unconditional interceptions.

What they solved smartly at AMD is IPI generation and delivery. That can
actually be programmed without exits - a unique feature compared to other a=
rchs
to my best knowledge.

Also, external interrupts can be delivered directly. But that is nothing
special. We just do not support that yet because of missing interrupt remap=
ping
implementation for Jailhouse on AMD.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6a202fd4-2bc5-f262-057b-cad0d90c1f1e%40web.de.
For more options, visit https://groups.google.com/d/optout.
