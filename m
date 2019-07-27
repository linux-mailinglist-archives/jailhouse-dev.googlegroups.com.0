Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBW6357UQKGQEFSKNVZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D4677739
	for <lists+jailhouse-dev@lfdr.de>; Sat, 27 Jul 2019 08:23:24 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id e13sf5673393lfb.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 23:23:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564208604; cv=pass;
        d=google.com; s=arc-20160816;
        b=i4m6WTK4N0XcG4Wa/40sj479umlq+Rx0LH61Cz7LYRq6COc7zc2+g0HnSuY9oROhXm
         mcsRdcNv5LoZLrJegFQjibBLYsbUyBmqkBcjY2SvwoPQSNwStM7/aPJQvfbh32+7XYQf
         EIe0f5EUH3u75ASBdVvKPiRg/+c1Jf1Aoxz5RIll8J9vxaTiReRd6E98zMj2w4E6YLjS
         DaqG7uRlKYdgYW3lIvhaav6lFNcUe/wW7kRBekdUWSJvqUurRTke1AukHuj6MAvYD5Bt
         s9tL8KMBB5MNLjurpARYarFOEcXo/wtsVkLttND60bJi8iO9eJ51DqvcHrXogemspeic
         0iLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=M9MURZPA/bWNnsc0hwzCOiiqUTTgIyehSBLmriw1u1g=;
        b=v83yC0M70akZeQ/ZRWSqxYOdWwOm7tdXtd9iG/ZRrvke2vHqS53DTIfMIV2ddB6YuZ
         yhXMVSazxd31Lgg7KrIHMW+K+DsquA0Ithh0qcVSgX7dpJ0RURPc9GlojUin5bVBeZHQ
         bQ11XkloV3T6yyyMK6NmcI+WeoIh8vwhdNWHyVtHyGi8fPKHivb+XxKhRZTOiRk2lkbG
         CJElLgt44oZXbiwsIhZdV6O7/fLIS+77XcwHLwl9cR/1lvpnr0UNUApoL9a8cPEDCXaL
         FdBnqk312SEEcdB4msXJAVhr6HuVnCIBmqsixkkNrrB2b9BDFA3y+E7VgfTbLWt6XWWo
         BgRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=c2egjRGi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M9MURZPA/bWNnsc0hwzCOiiqUTTgIyehSBLmriw1u1g=;
        b=O2wRsFJkXbPuCh2zNxcfMQqzi+u20k5skLcadIiJb1mz1Z/YqiUg+q3fGHRnwoZuS7
         yCrwIy7AMpd+fzEM/K+3Ti+IFAsgl7jPPwJxzktgkY54TBd24Kf/gEoJWaACsoch3Qsg
         2NYqgobt9zHouaTqI2egnPXfWIbf1c6zTWh9ApuMFkzAU9ByL/1hU0mT3RwwMTcLbGqe
         SpK0xMs8ZvvaVjmurIhi2HqEa/Rc9+GHZ/G3nYY55N9iZI+Sv2xRhbRrEvEhDVc/1ZNe
         TCDQEPFPnunhdQPE0sXjPRnwGXNNOmAxRKy0u4m3p/XO9KfQH9vYrPK2gEmfUe9f1UsX
         xNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M9MURZPA/bWNnsc0hwzCOiiqUTTgIyehSBLmriw1u1g=;
        b=mvqSpO4Y2j+wy8atQv37WltkqV0caMBgrfv+UZ0RLPZh8hOEH53pDfSBiDPtuMFl4J
         xAmpHOt1ysz1kwo9WeaaFrlcvqvgVSSjNTUOJtDKOh0esbpd2lIR8tH8i+T5zof+J0t/
         D6tZyu9Itc6+jPDMcMmxtr+0mWwZCnjUCucogVfky6sphWes5AAmsmKNe2llLiWC2ZQO
         1sgTbNZRAT17pH5KkwpEcyQmLIKUFYc6ZFP9LSk4zLmbJZWVIQpYTgKbwDrryWhaR6rt
         kNkVoQHC/X7aGQvZn4QNFB9CKTTTnr3SAwml90Jtqz9ZpV5ANaSOixcGTfNuPSHR7yFi
         kYlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXP474MnsbJ9f1ft4R8QgWFDCeKqdwfknCXTU9n0EGWhzWtwSr8
	zH3rwZG7o5rm527Y3t3CgU8=
X-Google-Smtp-Source: APXvYqwe0O+QlrR2VtcyiS1iq4a57yFBcp+ddc1ZsaEMilhbwhv5ZeKsq2xF5EAdfXvG1hK221rJlg==
X-Received: by 2002:a2e:c51:: with SMTP id o17mr11356316ljd.157.1564208603973;
        Fri, 26 Jul 2019 23:23:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8854:: with SMTP id z20ls6369791ljj.5.gmail; Fri, 26 Jul
 2019 23:23:23 -0700 (PDT)
X-Received: by 2002:a2e:9f0d:: with SMTP id u13mr5595180ljk.186.1564208603162;
        Fri, 26 Jul 2019 23:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564208603; cv=none;
        d=google.com; s=arc-20160816;
        b=tXFKCw71dPMcCchObO8XSbnX1btYqGN6+RlrSUny4jZzWfTKPZXd+FoKNZfZTgJ/iq
         65odSIcSmK7ngS1ML0rcuYz46em1Df2WpO6bV1H/zBsL6RZVKlaoXKHW8Bu2aKjerBNB
         nDWmzB7CsduyuxvueZ5bNapZxtoyOWKpGYI8nyoNunaRHOEZbk1uRx/pLFENIDEADo9u
         r5YhulnS0jvsH+OnZGpEpioNc15wvg+9qtwj7e5GPw6cp4t+Xike46rOs4QTUWkzCx2A
         wgxXIFduMoPq3SWsKqVNsCiYKps0UpCrlfD9aioL18r2MKd5eVxAZZEK+CCftZttptjm
         Qq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=/oGUoSeWOJP2+2uz5nTgJ2cASqnTuPUpxKMH6PSF5m4=;
        b=h+XKc2wbxV1YjRTrueWEHNStfRBRKNXNWlXBGMDq3ugGPJSCwhrfG17w0jZr6Y4pNd
         pEUPMl7cbzQY4SnyuVTCa5DBHFidZgdhEu+KGMMlW4FtnDNHKskwKzL/5Cqf8Q35sxeG
         l5kH0LZYYpZXr/tVzmEVC+7e45fx64qbr/ivfo27LYQktEnYimbWs+WSgBYgcNKpCva0
         zYw+L9OwYSfDI8IOr7c4lKEIf+9haBdakVGka3YljimEIQLcd/2slD5z2xt382kea1Qo
         mIeWFKTNgFYmHZpZwhHjtds2l2beal+Q0MjfGWrkvB4o6WHPsK2aAblf9eM27opEj8Cw
         4Ogw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=c2egjRGi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id b8si2430464lfp.3.2019.07.26.23.23.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 23:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lrb3x-1iXcrk2nwj-013LPn; Sat, 27
 Jul 2019 08:23:21 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
Date: Sat, 27 Jul 2019 08:23:21 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zrOvHyp1s/rb5q9kTgWU7TZ6SLCMWHyL98QUfGt71CLykQE/jPk
 P1d5rybMCTo6JYO3aCVjphjFaB7vOgRg5uaVvxrznacMZ5arZfTunGlX0kw3wOspKkBfrWo
 krn5woz9no0qAYwPY9KusGVzHrESy9bulK+JR1SP/XpN1dmG16ziBCtx4UyCwEWl6ZTBfwF
 dPD9mqh6/ogAZGLTLuRng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5QohrKKGdeM=:DZADKIN4b0B3BOxUTZo0CL
 mHh1m9l4xIgAn5T7oNT47KltQ5dmeE3Af7DvsmJ8tOIafP7+aNMCPEqVEjxn5zGV4wbB86uex
 6EBqPEC+f6zDEGAXoAEuxhRg1hz8v71jZRsMNe/JVR8I6cvfoNMP3xhph9FGr0Ojoo39pibZG
 q2KjCjovjtXAAZ7+UYrLHMcEaIIQWrIuMGTG7PBKCkSuP6DLJN5s7qZaS5HPTycHYWtvHYnpq
 kn+b8bLgUQfZjmB7mvctSPjgbFQPO9xLAU4StiNdIFjRwtW1tyyoiDZyZFNpz8u+sI07/B4uM
 O/3uSMJ4o/+eFUc7fgqwcnAPUekkMX0xy3tPBCtwuxKbkxsK7WxcY7FvdErOrbbmtYBc4dNDd
 2v20EBW2MTDLqSbHZ9gyEQx6f4bphPO5UqxyYnbpXSVQc4TRqtjlzXKugKrRPqQ3qhQcvZBTd
 IpxSjRZlnCDAWEeRpDUsbUSejgAzIfLRErKF1sc8TIk6onry3Y7UGeP0c+qpkMxXymiCekFM9
 J52r7kn5R1Hk2uqZ+6rlYxLfr2LDvxjDzngJnjqEr35sORFMgAbuSS0W+ylxA2jTJqeD9G3ac
 HWsuk2MOxEv2F9ldo16aHngS88TpAq/talOw63owpHyPW6/67OiATygV9keQHwAoMQS33b5TK
 AIJNB7Bo4uGO7jiP3QoVthISaWpWDByAMTtX4JsiXHSRivIWw5PqHdIO+tBqyeG8bha03uvRH
 1W7XyGf5mzX8ceFVTYPlBrq+T4+wJ/lK8MJHM2GU7RAp/1cOkPkfxywKmtoQmHRrzFeTgopts
 7n2HdzFmS4oogJmlFldzrCgM90i9Lk6YBa20adB6fULadt81/Jr6l+Vei02KT/2B6tVnOiUrq
 ruquAyZ4nShyInNeCccd9E/OpxZMIFD6MUl8/PqB46LGLuYD1CrsU6gkeu/iiGAsay5bXoNi3
 8p9a9/73E0kVpfVmWA8k1FX4sU9OUfvFbfSyfwx9coxmbnB5OEcdxC/KhyQ8kpasE0Efs1sPd
 jUqYMGHmQeUml0V16K8MRmDgSGB2Z23gEQl9oZZUTcW8J+3D22IWLiDoV/1cnjHeFUGMYNVjP
 hUWxzYmr2l+6E5FyP9TqlkTUEyJdToPQBcN
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=c2egjRGi;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 26.07.19 21:04, Jo=C3=A3o Reis wrote:
> The kernel and initramfs are splitted. I don't know how does the decompre=
ssion
> factor works, because the kernel image is already decompressed. In this c=
ontext
> what value must i place on kernel decomposition factor?
>

On ARM, the kernel is always compressed. It decompresses itself on startup,=
 and
for that it needs some extra space. We estimate that by taking the kernel i=
mage
size 4 times and add that as decompression space after the kernel image. Th=
e
initramfs is placed after that.

However, the placement logic in jailhouse-cell-linux is simplistic: It only
searches for a single region that can hold both kernel image, kernel
decompression space, dtb and initramfs together. Spreading those over multi=
ple
regions like you created is not supported. You could either rearrange your
regions to form one (if you do not depend on DMA in the second Linux cell, =
you
can use virt!=3Dphys memory regions as well), reduce the size of your initr=
amfs or
use nfs as filesystem for the second Linux.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/19e76b74-6d6e-010d-952a-5a36e606091b%40web.de.
