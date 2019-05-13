Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLUF4TTAKGQEQISTCXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D31B004
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 07:37:56 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id 18sf2409009lje.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 22:37:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557725870; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ec8ctp6HuKi4nv3enzr/pcFThObGsSnsnU73PeFy5zXK1syg/nS3ooPDGozxABirvh
         jJrHSzAZR9hAXDezHV8hFoRyEM2HQMgQRMIvdklC3hchiA4OyM9RE6k67+s60R/w9U7L
         2eKkvLcamxXJVNzhqiFfecd+OjRDekMWN2CCprx90TFSE+8WVLV1O8fWV2sh+WmgDD4o
         C9V99eWZtOzC6FKwfz7ybfN5FjqdnDd0Ig00Ltc4E51tn0YjNkfT9G+fUjXVrVpXKiRl
         QGNx5PaKR50fvYwqcqnhhFNPerj3VcKREHq70FN61z67t3gEshdgQWmcM/tObC8SMNxW
         D35w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=fbDNsfFS8B69pgAlfJjG6Goq1H4DN2p3QLm3Tazeri8=;
        b=sysKtoY79GUPukCMX+M0/Cozxj8R+QFoqX5NP2vN4n5gJ9gBei5+04fciDSMWujKAT
         ttdZT8M91Lj/DD1y3HiYJJJBCQWL6lgt5ih1ArubbLRE9IsPYqxdiiF6QTl5nIFYtYck
         Ogw7Z82ucnQjwvFSISxtwDCRHma2EhWbu6tuw/sr8kFQq6PN1jSpJ0OYzs9x+k9k7377
         WWqKdcuLsLhpxzFabghXZMNRzti814nTkwkfQ/OpM/EQbhD4S2KVmMPGASefUUBMflQ3
         2LiSVZvFuAoOGz2rL0tB+IQYzaItXTf0ziw8CyauDs6WtlGL6gF3QgnC7BARAP6DGexB
         2feQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=DhM5vIsJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fbDNsfFS8B69pgAlfJjG6Goq1H4DN2p3QLm3Tazeri8=;
        b=G25CTxyR+QNiHLHr0lob57uFOfZwt+/eHzhkhYYv0VdJqKZFOmTwqFO4TbS/WZXFju
         u7KuLyE9FYhcUebrgnvYIYt5sUR7qIpOnHzTX9zfyFfRgVtP59jKumQfKuQZFBFyzJkD
         1lreaZJDyiGe3U0j/JhD/IrWrntLXT+8v6YNgrh1sw+6jiurqHa8W+L8LR7/IhDQw6rX
         hDY4V3BMVdIV9dhnLeAiEHgB7MZveoJ24fiu1/xSylx3juIA3xDPhKOZI+A7meAskMIW
         C3YSr8WQSuICPHkZBs7VBV8dclmzTRWP5/daZq2FWlVYGZ9wHii4qmiZrFoNG6fAW+oy
         967Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fbDNsfFS8B69pgAlfJjG6Goq1H4DN2p3QLm3Tazeri8=;
        b=lZDGChCjqEzDZOrd6D3aCLL9ke5ZRtt/nU+y9nUOCKZDKxjgRoL2Cj30r1jrD5wt1g
         zJVhooRwzP8dsA75eIO7gSQjk7O+3UP082jiWIS3C28qfZcRJMqSxS/46IIFpFtEfKsx
         n1klBHG1Zlou0lvqpFNyfe/F9CV0Gd1Rscvcq5fWi2vds4Cd/eKjiSHQKFi2zz/7I6Ws
         3SfGP3ISFPoHY8Fi+cYbLoPFGE77OleMcUJTj8xrgcY/Q9FyKxPvFlIaisK+0DOL6cpW
         3RXNhlF6vIoRP3jbJOWinkNNdIuSqo8+KGRuAAKuHC/MsZ2TbbvMdRRvo4iLGkAbczJz
         xb6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXu4uWnBNkhAI3uXIrw1P94s5aJ08LmlnA5ZmmN63PmZxFhVwNB
	ou3R+uurAI1JpKysHpJs8ME=
X-Google-Smtp-Source: APXvYqxIHrPN+uyFNbxowOMn2+Zsb3KjSt1fpZCcNfAfThXVkIEqOoIYIwAH6/O2GKyrCbm8wqRMQw==
X-Received: by 2002:a2e:9cd5:: with SMTP id g21mr7657411ljj.39.1557725870803;
        Sun, 12 May 2019 22:37:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9c88:: with SMTP id x8ls1176185lji.11.gmail; Sun, 12 May
 2019 22:37:50 -0700 (PDT)
X-Received: by 2002:a2e:9002:: with SMTP id h2mr12367182ljg.164.1557725870327;
        Sun, 12 May 2019 22:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557725870; cv=none;
        d=google.com; s=arc-20160816;
        b=N8mLsyMoRC26qHWVAWf5vLTj8CWoH6rsZy1Y14BlZ4/qhklOGaRcAeCfWKjGgtA6Uh
         QO5WyGUadWFu7Yi/j9lRvn/ssDITWqrfqrE0kehg7gTgvkxD+M4H+PP3UDAUDX2jd0mw
         Sa6H2zpvf4QJnnBBOF73dth54VpTO7cFOmywF+S3v2rygGQ2wT1vAVg+BzkErnVq7aQn
         iYeSgJXmuCAxLSIkqEUjlgUgcEs5d02FNVpRzXwR3zJyyouLnDkNHSWOSnEJEsf5CSPd
         OMgfdYax5dgtmWFGmTyQtIHwOWegY4DIvRN+sBlPFKQQIvYYYaPckNvnnWHaDaZ3OnXl
         QWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=fYoPYNGmZwu0dgYH/4jqcLLBg5neltPGpZBqP7O7BVo=;
        b=uRZ9peJIM8Ic1ZBVCi+RnF8bs73t8xriEwOpSyqzxGw4rOW4FNC4vYIrTw3qEirr1b
         5gqznwQl/30SDMmJxJOvdtEtiyIMt7KW5q4yc0lZTFHwfnd7IDBTa7HZ8jAXAC00vsh3
         yASXUkcrUXEXq3PnjHKprxioUs9lP7d91pBln/rCbZ/cHLB8NvVPNq+zJ/S0oKTodl63
         47q5mE2zkNYOK+B/KjcUIA4ZxfSVOCrXYUsl/Rf14soqQYVwSzYiuMPupMyIfhBrQrP2
         atm8wDIrufro7mWMCUXg6RgBfKdGQY3b2NGK0BVStJjztHziLk3PYrfuvR0SlDVDq2dj
         8PQg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=DhM5vIsJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id c22si2105494lfh.5.2019.05.12.22.37.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 22:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LetQh-1gudRi2M63-00qmOT; Mon, 13
 May 2019 07:37:49 +0200
Subject: Re: [RFC PATCH 4/4] inmates: x86: activate SSE
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
 <20190509210726.23168-5-ralf.ramsauer@oth-regensburg.de>
 <9e20c6a4-6e91-a547-8040-1e9fbd9614cd@web.de>
 <9f486f2e-b7a1-eadb-3c20-2a70e6422061@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <96585c2a-3014-0791-e2d9-25709d4c8c1e@web.de>
Date: Mon, 13 May 2019 07:37:48 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <9f486f2e-b7a1-eadb-3c20-2a70e6422061@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:gVux3r2MgMHozh6/kWuUm1lkpJ1y7pCT3ngMutefCKykHPFsV+f
 pNvIoxu6z7Qjfb8elqDUCY4wH9aSWhX6dJstjhR7LZkILjx+oUsZ3Er2gK/KtlvWiOoVR47
 NRuxLBG5lcPQlY6OyxekDYjHt9q+AgJivrBJ1QbSMsLMjFCuUYT1VttYHBtTHK7RumWZKxY
 dgaiUXsFr8KCiLwbEt8nA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qwwQGlpH7yE=:at34znblnOZ0X/nFDzXADp
 jeM1G23apiYtiKOtR3W6UcMylk0K/U0A2abt3cp+HjVbrf2t203QfjvVMTXusac4ccIcIaDjS
 rMkGDZlKUUjIMVHj0l+ndvmhtMemiDIqOTHwGOmhalXZbOygkmb0Gqn2r9dwc+Ifoecvwrpc2
 mhUpYY2HGSD5Gg2aca/ubKoxjSlwsWuo8q2idQASEtCaIkkCg4QCWVAWiDUgd7Q4/9H1RJyJT
 eR9nkls8UwsrMzaGsa2YhikP+rpD2P+eg3vgL6SKKkdjXQrFghtEb33MDCPuIQ+/ch1VomeJv
 R2ABkjCjoAi///Eyh7A5vX7fNoYRdIFPUhUeexnayaodOzNRPxnZyaNnZvcrQg0HWxJkvStKq
 fKDDO8mtPUobqzuO0hRWssTJmeR1Xz74N4zsx049Ap/bI3LdePlRFVeP6ldNcWJs0JFIdieC5
 iAxmdLOqaQp+Xclk9W2HsRFzvgm4+0OzH/7mAuSFRqT3tRkSvQAum+smcawuejVwXGIa94qe/
 H38TLtVC9gYTzETzyRnXZlEPLK9AfVmrh/drsxlmpr002Xm3CPDjNzM5cLB4OWQ+Jw8/yfOhd
 NVzixmeujZydCwV1ioZ8eqRN7v6O7zyNullXd+fLtnO++kZXo2A7Wn5g7VEj6+Wc2pwYLADo+
 ZabVWEEHjVVX+82TbcQklSZnU0vEfDZ97lOJICXl7cLDXXqJHmCr839yBOa3fhSErRCYMxPo3
 T/zt/dgE7l/C2kpUQuqPRLEafP4enV1E4skgJWznRXh67j+8CjftF7CiJ7ZcnOZaJ33aZ9oe9
 I32lLuyv7cxolGs75tEo/pZvmy+OJm1idRNh/eGyCJ5/6vFIbjuAhZKqBBq5/Fk/dQvLAUcuH
 /JEeuszivoVLiEGXBaB+EDxlK9gdPDtQLS3bFSwFwApQq4U3DnfAiCys9utGyWBts9fSnbPXg
 07EJyi9i2Dw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=DhM5vIsJ;       spf=pass
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

On 12.05.19 22:37, Ralf Ramsauer wrote:
> On 5/12/19 12:01 PM, Jan Kiszka wrote:
>> On 09.05.19 23:07, Ralf Ramsauer wrote:
>>> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
>>> hex2str or cmdline_parse routines). Inmates aren't able to execute those
>>> instructions as SSE is not enabled and will crash.
>>
>> Actually, this not only fixes automatically injected SSE instructions,
>> it also
>> enables their broader usage, specifically when doing floating point
>> stuff. We
>> should add a test or demo case for that.
>
> Ok, should be easy to find some reasonable test cases.
>
> BTW: How should we handle SSE/AVX exceptions? They're currently not
> catched and disabled.
>

That depends on a general exception handling infrastructure. I started to look
into that, but it takes more than a few additional lines. I would leave that
topic aside for now.

>>
>> I addition, I would like to see AVX activated as well, where available.
>> For that
>> we also need to enable the corresponding bits in XCR0.
>
> Will have a look at that.
>
> One last thing: is it okay to just stop the inmate if discovery fails,
> or should we set an appropriate cell state in the commregion before?
>

Hmm, maybe we should actually make that non-fatal. The user could decide to
inject compiler flags that will prevent SSE usage, and then we should not block
in the startup. At the same time, not signaling the reason of a stop is not very
handy either.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/96585c2a-3014-0791-e2d9-25709d4c8c1e%40web.de.
For more options, visit https://groups.google.com/d/optout.
