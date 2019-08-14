Return-Path: <jailhouse-dev+bncBDM7BUN37AMRBWXUZ3VAKGQEA445WJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4238CD07
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 09:38:03 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id q64sf1167680ljq.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 00:38:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565768283; cv=pass;
        d=google.com; s=arc-20160816;
        b=xew/cKJFWlMOmUGeICgxp0Np6JbmGn3SDehmzJimvqJcp51pS/rjqNr7hTaAmd/Yvx
         5hoF/P+Aafx7xdjoVvROWyS11ghJ9CXfpanN96Hg1L8rCJG93MR5/Ed0v+1BUvXSiJD8
         z1qrhzBi46J51PtIf6QdQg+HmnAh0oN72v77rniPsq1iwPT6gPtUPp7BagD7B9uWiB9I
         D0qajO8xjMTFY0LzY4U08A3yVrlnjwQglpaiOimJ+vOpF4juIJ8xEFf3Qu6VizLbDL+9
         4lO+cdR0gOPSSXkChPqOUkwxCfx2lKU1i8rqD0Q+AqTh4HjZPYahun2EHms3Wv00HT2Z
         oK8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=6RuJuI+FZcEwqIfPPLzZ54usPMIeUc+ciOcb+Ems3/0=;
        b=wq+4/8iAO0CzhpIi0C/krxRbH8zeegNxfp4BojJCSY5l9Au60uAI8WFks1utUOu0Db
         h9/HzWhbo79+4RaY9rKDNmvY5F9oapRO1vV93kx/uMVVN/61sJznXm5tw1pDSE/W9/uT
         u7rDs8R4T8GlvYrEIQ5cDCG1RPCOWJkj1AXUVExVBRnzng7PRZYvIfJZcYcCkJDGpBwl
         45GjpWBanLdzDnqwZKdhA7nvUMtP1hXbD2UxTmanWU7nxQFmWhNr+V0NMRokZBgIHN/y
         wg74tsNGrLFwIbdZs7kfRb1Y7lwMydf6BDnKe/R1Kl/VvoKqFz5yA96kY35dCKP3Q5yB
         mE3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@retotech.se header.s=20140924 header.b=GBv30G3P;
       spf=pass (google.com: domain of ola.redell@retotech.se designates 46.30.212.1 as permitted sender) smtp.mailfrom=ola.redell@retotech.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6RuJuI+FZcEwqIfPPLzZ54usPMIeUc+ciOcb+Ems3/0=;
        b=JKTIN2tv31D/xF3YrwLpPgMTt3kSxFYlDpBkPK9pPubve54GbJMh3gN9DSG6aV1qHq
         7jJyMH9jVnZ+3x0nfWlokzjishxbmWljeanaDQXKuCTmryaa2zQ4rlbyACW+7YSURg8Z
         9VquHCmYuz4lSLSTfjtQ06TenC272+Anr9BxmEIownAQIyXsUq3nNNxvJ0beGqGpq8Bh
         liYsqg8ZtBykvJg5Z/KhLFKwH42opXh4waNxJjUapuZyHANSFbxd0awcGnZtwPf6m47I
         UypDyQgVlztEh0kGeJpo0Ao4eTMTVJFyHCgG9F2fvm5qMNxdyNQTlYXAPQ1HeXimYgda
         VAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6RuJuI+FZcEwqIfPPLzZ54usPMIeUc+ciOcb+Ems3/0=;
        b=HvUwcijxfK+2TFF930FqW5IkgyrrO98Zhl6eI306EIF42ZUT8vBR4gwvDSgVylqyiG
         5IJbNhSfECRpOzRaYF4sFWeOLHusUD/0/qwv0B8K7AMKm28a1MyEBW9UXey6WySh+I1T
         NKIN22tZUoY6uhbhIp0FElPCdc9PlWduMcS10RQ8UcDYPDiGWpwX5Mu+sCrbZb1l0j7S
         a40dBePIELh6RVVb/83lzmlPT4788Y0mmsYl9V7inHJQRJ11PN/LGtG2hsemiwrC3/Cf
         uqWUIN+PfqmvJbkieSAQKnrbRsAriIq3NgMe/4I7sYeqk0yiRX6M5uv/jkwZCqLMPNhb
         mFHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVfw7mSoWR1KvgjdMIhut3wWdWkXB32Ts2RgP9jJbpm7wFMeUP+
	UYLQ5r2kYK6JCwC/2aBS19c=
X-Google-Smtp-Source: APXvYqy7BDQieSYDIhbYzrbww/yNIJDMqP7O3tvTUQuj0/zcT1Hqc0GR0nmd/CBOEWaFg6FJ3GAx6w==
X-Received: by 2002:a2e:6342:: with SMTP id x63mr6708649ljb.95.1565768283491;
        Wed, 14 Aug 2019 00:38:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b60e:: with SMTP id r14ls105066ljn.13.gmail; Wed, 14 Aug
 2019 00:38:02 -0700 (PDT)
X-Received: by 2002:a2e:9192:: with SMTP id f18mr23932557ljg.52.1565768282391;
        Wed, 14 Aug 2019 00:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565768282; cv=none;
        d=google.com; s=arc-20160816;
        b=wSdM75i70f8r2q/2Y6jyamK/NPTBHQW0RqbDIQ5Xdwv2TwNkB2ciD/u8jZ42zxj5W5
         4/GnMAZqUnjt2eI/8Tm5Vvpq9iHd6IBIOFC50YuCvTinG8K2vrnJmnBcc2JweuxLXP72
         bHt6rRIc3SbXg3eO+mReyBWPa9knRxRdSoBx1fyfjPnEUsQAdQqIdNJcND/8+pK41+WC
         arxccn+PGgDhZ+SZR7w/kQMWDfx4jPAIy2sqkAuMseQpoYExWuW0rNCgK1pjxICJ93Se
         LUNGj9We5zRxtRJiX8+t7bJTT/2R3HrU3r/m4ixB29rVOU0D8RIWdIDflEIkFeXx6KAk
         PNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=AVwtnmm8u1bE+21AriK9OQuGJB2vpio+l7lqTHPw9Ow=;
        b=WlGhBZiWFqM0St/5m6eCK8YxbbAmiwozImz1HCMuaum6QCfa++R/WOVNw1Z/Y1u7IW
         7ikLfHOS5D4VSrqS8lAhAlBciIYuy3U/MWS5G14CNcPUhxJxKTgz41j1FTdzkddzDmZN
         u6QpaHg7YATLUl1aD7eXf44rgVgFeU552HmXvihs8tLSdsDQ/PdFNNBXMo7R6OYFPCDo
         yOIc5cNEJmcznpBIPevtyQkbmE/eqPt/QyURo2pbBhIoG6EdSovNXUloxaBRr9eGzku6
         gXm1CQJN1i87+GJzMSOXGvGHUGCLt72Xe/zf9oBJbQ6BakJlH3UkRk2BP1y+bvRkx5hI
         vTmQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@retotech.se header.s=20140924 header.b=GBv30G3P;
       spf=pass (google.com: domain of ola.redell@retotech.se designates 46.30.212.1 as permitted sender) smtp.mailfrom=ola.redell@retotech.se
Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com (mailrelay2-2.pub.mailoutpod1-cph3.one.com. [46.30.212.1])
        by gmr-mx.google.com with ESMTPS id t23si1569591lfk.2.2019.08.14.00.38.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 00:38:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ola.redell@retotech.se designates 46.30.212.1 as permitted sender) client-ip=46.30.212.1;
X-HalOne-Cookie: 6c4bbe659724989023910ae17a5bd04885d73e68
X-HalOne-ID: 71a49b0c-be66-11e9-b9ff-d0431ea8a290
Received: from [192.168.75.19] (unknown [94.254.58.242])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 71a49b0c-be66-11e9-b9ff-d0431ea8a290;
	Wed, 14 Aug 2019 07:38:01 +0000 (UTC)
Subject: Re: Orange Pi Zero Jailhouse Yocto Integration
To: Henning Schild <henning.schild@siemens.com>,
 =?UTF-8?Q?Cevat_Bostanc=c4=b1o=c4=9flu?= <bostancioglucevat@gmail.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa+--w@mail.gmail.com>
 <a17c3513-f573-84ad-5d4e-5027121e51b5@siemens.com>
 <CABPcKDNb9HKXNHGoUY84WnFup2wn79zsoHzDa-i2xeaETM7VDQ@mail.gmail.com>
 <20190814085057.43ce8c63@md1za8fc.ad001.siemens.net>
From: Ola Redell <ola.redell@retotech.se>
Message-ID: <f4eb47c2-7a86-3e6f-8ae5-8e84ed8b70d3@retotech.se>
Date: Wed, 14 Aug 2019 09:38:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814085057.43ce8c63@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: sv
X-Original-Sender: ola.redell@retotech.se
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@retotech.se header.s=20140924 header.b=GBv30G3P;       spf=pass
 (google.com: domain of ola.redell@retotech.se designates 46.30.212.1 as
 permitted sender) smtp.mailfrom=ola.redell@retotech.se
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

Hi all,
There is also an imx8-dev branch in=20
bitbucket.org/retotech/meta-jailhouse.git with a jailhouse 0.10 recipe=20
and much of Henning's changes. I will look into updating master to build=20
0.11 and test it for BananaPi at least.

Ola

On 8/14/19 8:50 AM, Henning Schild wrote:
> Hi,
>
> i did not look into the problem yet. But my jailhouse layer for yocto
> is on github.
>
> https://github.com/henning-schild-work/meta-jailhouse
>
> Have a look at the branch henning/staging for patches to get a more
> recent jailhouse to work.
>
> Henning
>
> Am Tue, 13 Aug 2019 14:31:36 +0300
> schrieb Cevat Bostanc=C4=B1o=C4=9Flu <bostancioglucevat@gmail.com>:
>
>> Hello,
>> Thanks for the fast reply,
>>
>> I tried with 9f233898917f8c1141132606f2f2c624405d8c81 commit and also
>> latest commit, still have same problem.
>>
>> I will be appreciated if you guys can provide/help with examples.
>>
>> Thanks,
>> Cevat
>>
>> Jan Kiszka <jan.kiszka@siemens.com>, 13 A=C4=9Fu 2019 Sal, 14:09 tarihin=
de
>> =C5=9Funu yazd=C4=B1:
>>
>>> On 13.08.19 12:39, Cevat Bostanc=C4=B1o=C4=9Flu wrote:
>>>> Hello,
>>>> I am trying to learn/play embedded virtualization tools and i saw
>>>> Isar Integrated jailhouse-image repo, tested orange pi
>>>> zero(256mb) image and everything is fine.
>>>> I am trying to integrate latest jailhouse(0.11) into yocto
>>>> project and i
>>> saw
>>>> https://bitbucket.org/retotech/meta-jailhouse/src/master/ , which
>>>> is
>>> for banana
>>>> pi with jailhouse_0.8.
>>>>
>>>> Anyway, I ported jailhouse-images and meta-jailhouse
>>> together(meta-orangepi,
>>>> https://github.com/cevatbostancioglu/meta-orangepi/tree/dev) and
>>>> trying
>>> to
>>>> compile for orange pi zero(256mb) but I saw many errors while
>>>> building.
>>> can you
>>>> guys can guess what is the problem?
>>>>
>>>> my status:
>>>> i am trying to build exact image with jailhouse-images so i
>>>> patched
>>> u-boot &
>>>> kernel, now i am trying to compile/install jailhouse.
>>>>
>>>> You can see build error as follows,
>>>> also attached log outputs too.
>>>>  =20
>>> The errors look like they could get better with
>>>
>>> https://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f2f=
2c624405d8c81
>>>  =20
>>>> My repo:
>>>> https://github.com/cevatbostancioglu/meta-orangepi/tree/dev
>>>>  =20
>>> Thanks for sharing. Henning did some yocto'ization for an internal
>>> Jailhouse
>>> project recently (though that was for legacy vendor BSP) - maybe he
>>> can share
>>> some thoughts on your direction.
>>>
>>> Jan
>>>
>>> --
>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>> Corporate Competence Center Embedded Linux
>>>  =20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f4eb47c2-7a86-3e6f-8ae5-8e84ed8b70d3%40retotech.se.
