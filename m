Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOUU6HUQKGQEIY45DSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D11B778D1
	for <lists+jailhouse-dev@lfdr.de>; Sat, 27 Jul 2019 14:57:31 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id e8sf27129144wrw.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 27 Jul 2019 05:57:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564232251; cv=pass;
        d=google.com; s=arc-20160816;
        b=IU6NOzh1TrppPmV+7cFZNtjcK0y5O3MwsVhhUTvw2xUpXyrvCwcciTxormJXNV/iKQ
         PmR/qdbJR0GZrM0vKG1fsYYrZm8fWNchThjJNQ3jpXTnJ3fSgb7Cn1tuoaDJAESrYVNE
         /WCWV55R/Nvdq7N8nr5aIDCXG/iOJYk3XdQjTMoBAMMqQdKztfGgaYjOLZm8qcYlTK0F
         GvSjHcaw8b3GPGc3XDzA8FZnPBJnbCTGadan+u5BYm2rJRdUNvVcqg39YUhxiGf9kqX0
         YCnSFl7/x2uBYkwRBqye062UX3GrQcLR7DM4uKT2Mr8t7zpa7dupfDTe4uwid4vf4lr0
         GT+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=WTZScVl6godkkCijyuTGksg7rf1qvYVD1eYxzwv7798=;
        b=vyE56LS8/GFRdghIGG2ZiuNSGOknpGKG7JyJbybWL4QE90QdX4eATa+LZ0ZUYEm1Ly
         If3GoCkqusITz4A2+BG4CgTQ4tQAPEfo8DwVz+NqGsZAMG0UQj5ji/op96OR87b+/EvT
         jp8Mje7sVswbnp7QHhncTyUIEg0mrJMXQqwOFUJafwgWlgAFsDDqLHxD6hqzzjBjDWnJ
         JFXQ2LYOT7qQ9M8M1QLttm1XLh5CbV/7CDwc2PRAn1csrMnb+v6dQz5SD8bhQ2+7+uGE
         JxL00TPVpuFDtXs3kElz/FcYDKyecU9eeobg1qaianXT41rWnZFwzQYHjdsz6jCEswHj
         x2dQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="cWpVh/16";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WTZScVl6godkkCijyuTGksg7rf1qvYVD1eYxzwv7798=;
        b=AWyN4XQkvuAtU6SV1OGHWAzOuW3ZRob8CNH2LNPIrmzS7+JB7pUukuptpeNOc2ZPu7
         MU/dUFqkABJvPV2Rm/IMi11ETf98hp45AkK2IErElnweGTFzOHK/x71Fw5znG6OSrSQD
         mdvl+AYgmcPu8mTITHVUyE2+A2qhcj+/wcZsAX7VyYq4kgmAWlVWPyqa9bAt1EZkxIx8
         WM0mBPr2nPF9VCAZN/kheTp0Ri4svh7yV9n+JI3byffgGPIvuCjuaYKoXSI6yFqrJ+bQ
         ksyKeoqoAkzRw0RUYvsn83pwuObZP+IQ9BYt+rKAYlpbh8CwJQZfjCvmjg33PFHDUwYc
         MiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WTZScVl6godkkCijyuTGksg7rf1qvYVD1eYxzwv7798=;
        b=DcDRKfsXz8PTbQHTkiRMgi54UWRD/fH6O0Kr6x2bh75tGqXfZ9fI3eAcZOef/zoc/o
         tfhhDC/uH7WOQYd1D3lC0KYt8lURbqPfTvz2rUuU/YUcgUjukU2GM1BrZZN4N/+ppaRN
         c6X7nUkw1mo0rquA9azqaqJR+SnaqLFR+6IG4q0DMWgYFjpRu9sxNM0tfOFCIxCJZkzX
         bCsMFi9ShZ1lftgOqbRn0G90u5dcVGK132ENqSJh6/kMa5gECnTCSPFJ3iXhqV+j9Pfk
         myNNlUkW6brOD2I1H5VYNv9Dh5I/jtMqcgN+Ll71mL5HLxZF4nddsJWrqwcHN1Lqojfh
         CjtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVfhSFngknURVJrx7BMY7DLTMvmGyqGJsKgKDniO3mEgFvlJfAp
	RpDRxTvMwagJODBXy6JzjNE=
X-Google-Smtp-Source: APXvYqyZilnyQnLdN2axGHDmvPiOXkqQOsq9lBDFvkSRLqtDcpp6+KoPdb8ywcq3F9BNBw6ApYFrHg==
X-Received: by 2002:adf:f6d2:: with SMTP id y18mr32931844wrp.102.1564232251101;
        Sat, 27 Jul 2019 05:57:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a386:: with SMTP id l6ls16417266wrb.16.gmail; Sat, 27
 Jul 2019 05:57:30 -0700 (PDT)
X-Received: by 2002:adf:e883:: with SMTP id d3mr21135635wrm.330.1564232250679;
        Sat, 27 Jul 2019 05:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564232250; cv=none;
        d=google.com; s=arc-20160816;
        b=G5/J7ymwYoG152uxc3KqTUJUooPYISOrPt8tuvbX7DOReKzoGNGc0pjoqVKzsoWD9C
         Pi4LXYSTdwivGts+07+8N9VQVVpVeg2d58MYyZ5xUo/8U4Wpf0oO3BDWyWF8G4Y+C07p
         50fWdlgOlM2WXkoPx/o57dLjWs1ECAbbPCvgawuXwcggGtVkWcBPIE78C9vwjzc0kNtU
         Agk2mpPl4zwaBsLoJ0vrnrG1Q0WM08lc67+SVabhp4oZNuAgOFWUC+uEX/r8Q21HmkwQ
         yxZEPVcM0nM+al5WIRTatChIIpO2CHZMNO4ezPh0mrC68GFOpuJjFzrSyPO18Pf9mCUg
         d46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=lnpuwPGRbF7ccitdNOxCvalT8y7Ofnnbteu+FIg739I=;
        b=DLdwQczZ3B6ML8ll/yFEH05mUsGl5eaUgBKLBAvfAbX39G/wYwi5w//m9asIf4W/ZS
         QG2XIcHE71Na4npwgs62dnb5H4Bo8ZygqqVcPsGH3ZufYishsmvIl+zQeEv4TpvnR1Qh
         0waPyqs59OO+Ywq4tTRO+A4Izi/9PHXDAv6EcyF8k2U9+Iw5+P1BLG4u/PzmZm2hF6LY
         h8PMmsh9WoIYZxUVkPQLpCaxTOhT2YqjPGG3TQG4RN2DFnsT4yhnW2x/lJxwhsKL1+Ud
         D7hq97/bOH9/W+rXPcP+/CtIbmKRamlzDKzYEN3+PbJgRAYC5br+LpJ4G0CZB7RaMsVd
         PSQg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="cWpVh/16";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id a10si2951890wmm.2.2019.07.27.05.57.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jul 2019 05:57:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MYevq-1hwHwx3qVu-00VQfR; Sat, 27
 Jul 2019 14:57:30 +0200
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
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
Date: Sat, 27 Jul 2019 14:57:29 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UnY6km72efAbBWJ/HH/QVz7j8qKsXOlzzXR75pY40enu9qLgR5r
 EJZgjaH+otqkoukp4qg+AlGhjtcJis59xD345MwaoxWwq73OXBwERkBS/wC25XsI2cyscZk
 W8W6OV/NggcoQs0Hxob5tH/2qOH5ChVg69SohB7TZYuJt8V8lV0veAUAJ6TDpNMiic6CETt
 9ZbGfIK1VWg22LoLjDhFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oz1UjO5x1mU=:Nr9Brqtz8W0KqAGjtQK6Sc
 kW5b3FHYyUOtL3pCRYN21yXm1GHY+6gRDb9BN6/cRIjncpVqHuCYBFJpW6IydOtg4tQ/m0nOg
 UVV6R1Z7xbnvmidbeZgvmQ9I8UOZTX6lE5gzhZhh/B/D57GK5Ho6Y4W2v8LHSGlJ68hVIs+wd
 y+yTDjFsCguZLClmZV/h8Q67BnLVhQWYYY4aItuC7+R6JEbXzdX5lKIHSjlbvpQBQ/Ezh2WLi
 DO/X0ChMsZMeTcFkhbPuYnP1pR0PdltACHXWk9JUYySFR1uumWENFrVftIV5IzZzK/NOOCFMn
 EqdOEYd77ojnk5QVMteRXhRRvrS7QMlCqJXDjVJfwR+LgJNqvFLQRvS/ernznLlTiiNb1mO5S
 LByF4EFcJFrfDsszIsvgSNmESkv8IyVcOhDjDfxYBwA3oDBYAG0J5RoYuRz70VoVtLSoZ/+y4
 YFPkvYrRyX4GB691Dp/LpCUNlkoN9eiUOiYehAn5nwZsoQMNaRqVPmwgH14b5/P3whNF91q/4
 u7LRCI8lGbMdMXaDy33W2/OfCKFJwx0yLfMJpEfDGdg/Mge8gxbUWn3yZhI0jl2poSID+2gPD
 B2r4xQ0NonzpuJcX5eiLuponYtjkdbsKKSNUxIPSDdqZkgGiix9mXWAhIKNyuPLKJVTd/tqtX
 kRYzjwrlb+emrrbMRcJ210s5TWL920XEoekQbWYZtfypmgEQC6fIEFWEmMs+EXAVpli6DMtim
 BsEf9s/IYfcXAmSk/vfKZRRDh/lkpZWmkuza3I0n9qmM878rjSv8WBkZjDOlF8mivGv+AbkOE
 IQdmY1ctUaqY8T149/56VHOP0XfstgYjP8ac2KqLcolhZ4G6HhYb5535IecHglr8JLVZbWf47
 StpB39HLedRZqsaitctIiIO7KiWo83R8vQ/eroNePlYhUZm4kY82bl8fh0m8vvlYkhna94q/s
 oO08bl17cKR/vK+lhoQpdSkVlr9fo20OJK4tAc5zU82YDoU+zVOAfGhdcoxp4eZguOQZlBDtW
 gnUVQ2+zZu9QIIcPzovmuHhGXEnLOUjJhesm7ZWWu9S8/3pC78dRtFlMgrLsBkNyrQaSAlKMZ
 WcoqffxBBi1i1nlTsc7l1nAj44HhLfJ0rYu/5RqpcaX9ZbVuUbvmwPEakcFk3eBhKaB0AjZx3
 yFNEC9Z9mVeeha86C/OHdi+U0vE/rNGZbPFaqQbFzmKvwuj+8Z5Fffp/pvdDwO6B8lJ6GdQKV
 TFYpdSVNOR7o8MCPW
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="cWpVh/16";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 27.07.19 14:34, Jo=C3=A3o Reis wrote:
> I reduced the kernel image to 90MB and the initramfs to 80MB. In the non =
root
> cell config file, i declared a memory region with size 0x5fff000 (~1.45GB=
) (send
> in attachment), and even when i issue "jailhouse cell linux
> ultra96-linux-demo.cell Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpi=
o -c
> "console=3DttyS0, 115200" -k 4", it still gives me the error of no space =
found to
> load all images.
>

At least the config your attached contains no loadable RAM regions.

Jan

--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/885b4c3e-8d69-e516-aff4-46f2e50cb622%40web.de.
