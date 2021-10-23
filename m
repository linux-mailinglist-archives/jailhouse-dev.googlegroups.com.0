Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBYGIZ2FQMGQE3IBNQLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5E4381FB
	for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Oct 2021 07:57:53 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id t18-20020a056402021200b003db9e6b0e57sf5607442edv.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 22:57:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634968673; cv=pass;
        d=google.com; s=arc-20160816;
        b=zc6F2ZOCPplqiKbERvmrfRT7N0+wdEmV9yxcPj0Q2w5WazxRHpvKCBD3SwlTcQ1LKd
         UBR/5Y67u1NMsqI6HwCSlf99NG/pvrE8P07bsolNNEtEFH+lwosAf9lfBQW9vYuUUh0+
         PsjswBMiIbsM6qhDBVQmTTnpOV8/i3rydlKzlnYwajqObv2YYreLsWdeXUSaUsZ+rdrR
         UTXExFJ/OYGs9mhLrO1fDTq27bXPpjdb/nf8Q8ySOB1nLC6q4efAXGdsf8KgPLpn7rXD
         5qpFrYCvumb6RpS3p+JVvZCX9pjyfUQQubWi7muJCFaqSXVLfaJS/k46zcRKV0DNrlm/
         dFzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=yHGrmALJACOcC2gGqrpDvVn1k2kVYfZUS5mbqLHyBNc=;
        b=T5OSrsxaxxVAQvDGjhTAPTbngtGmkXAduAtFUoTp2YvWROwyMZVYG+/9eFzm5IHbQU
         Dywa0HdrVDaaa1RKvNpyeBEnxHdcGqyAcXpS36oQJ1EmUoHxwrMdNsgaphUXV9jXu31e
         3kLIc2+bhor5XNwzIpy6gQT9hYxsqYkfCd+9XgimabS5huV1Yt8wLrEQVpV40eJjQm3i
         sM0/BdM+R9LnwmmtYs97EuyyA0k+XyG7KypfF06TsrtUv+KlgUCqFc5yUYMkijaNOnOg
         uLPAGfYbOcw4AI9sZ5YweyiuHSHzQp21zI9Srqb/+3SifEbcDqv7aw9UYvmZ4/zxWXdp
         cMMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PXewIU9N;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yHGrmALJACOcC2gGqrpDvVn1k2kVYfZUS5mbqLHyBNc=;
        b=Hwuh2EUZf7LPqKIE/30oaueQWc37eHgctm1Hyrv/uimpdwPcHTc4Kd0RUAJHUlmbuQ
         nS6Oq6sSgzFqJVRS357cb7ZkrnkD7cPBMOdmj/Jl4tyMPNvCKEo9DPCmd9KMbW/qg3hx
         IBv/jxdzOygIScVXfno5O8tPfoRgx5urXcQu1l5eSLv1xDsBNDteosxBk2LPHr1YaV0V
         pbSydndVAgKlCg7JPOn/X/NpxTxIyVHX9kDM6tWWK44dZpQS8khdovLzX3fwWE1FxCIM
         OS051abRx9h+1sWbCrAFZZL94lP/WYrYUUwTA16dmyl8gW/QGZsX3wIXOKLZI0yvUa40
         gIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yHGrmALJACOcC2gGqrpDvVn1k2kVYfZUS5mbqLHyBNc=;
        b=wc5SMpHl/06rQdI9igxgcm7MEWNkorqcjAT26LEWjfLAFJJ+4DSvpyJPKlcLt94a7P
         1wxLbQgxwE6+TYpv7EEgRwVY0yGuHNqRwrrt+tjBZeUceMdbg94NVVv0PAE463Uj89hB
         9BrjazNtCAkafw8gSyjhi+DFCFqi0On40rMYkYwMbNfsKL/LW5+iKeVyUgXCQtQ58DIe
         BQ2eF4RUneOkXW9Nl2vRZsXB1M+uk0zeMxeYc9HhlG+BZCT17FOs/bH2U9FH+rufZD7R
         /KaLJf7Wyvpn/Wkgk5tp0YywqvsCQf6bhiopLU/SeCoXY7sDalyMIN3apc1TmXHqyjp6
         xEZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532rxo4sxM+t5Ibyyma1yE2I6dGxUK3AMpnDnWPL4oIXKVG1U8wv
	7JLPZtBGyceM91PKWLV7OwQ=
X-Google-Smtp-Source: ABdhPJzccA1cvgSSmeQNolSL35ip0z8loAb9NRz8UNgcB2nD/8NdA2buLnX2lxsaOBbprqCIPXq6+Q==
X-Received: by 2002:a50:9f4a:: with SMTP id b68mr1090842edf.218.1634968673261;
        Fri, 22 Oct 2021 22:57:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7244:: with SMTP id ds4ls5428232ejc.0.gmail; Fri, 22
 Oct 2021 22:57:52 -0700 (PDT)
X-Received: by 2002:a17:907:2cc6:: with SMTP id hg6mr5113340ejc.21.1634968672265;
        Fri, 22 Oct 2021 22:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634968672; cv=none;
        d=google.com; s=arc-20160816;
        b=SdGqFt8ly0hZNM6JG0/c/SD2cejxsj08FEZrwn7so0ia7zTjkx/2rq4HSXAE5aHsCF
         HBhgQFJ8cqYYiwypnTQdr1nh9+LgiZlwsCSMBj5v5Ft999sCpzNLpYN9i/RGXSqBt5cI
         SDURVgNUXXI0lVkTPtLhppESUsVWlbpK1KqnwDb6DKiqnUTm4tHa5EU1eCPFYvR/5K9h
         wtFAYZW+3A3+e/90dftu7cSk5VqaUNLbAYu0m7lr6HUEve+WbNdQCaXM8h/yDYLQ/LfZ
         Bmjbl1NAGH1dc7npC8F6XxhbAYaWVTdAXuuzCNo/pGty6i6PTNkPDuhnSXCKea9qDNA+
         r6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=dbfeLXyerVmz982lYlk6ILHc0/aAUXQzfdl6v57y6Cc=;
        b=KRqypVxGK4j+e3EUQjTlQhH2Rr7N7oF9Az45EACQBMMvdvYU5xusV+pQDi2NLktzvB
         j1/IpWCv50q5kXbXhqJRubkurVYoNnIcpUPp+2f3RfuPZxOg9EPPxKkVoJmjhpB0Kqne
         KdeRMy2l1uy9/nN7dTviu+GpWIHsFCSSGJHxDchGGI+fPDJeNUE4YQ8lFNXS4whR9zA2
         nAzI9fbE6NenPWYJDAB4f3qVbXDgmqMPHaTOGNpqnLC+llI9Qk4qPzO1vKtHzU83PXyZ
         mXEkYYC1cQp/9VVoxyj5J/WAEYICzd7EP/VlMLlU3Ph0T2TOER7znk4ieZNY+PR+yqLP
         zAiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PXewIU9N;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id dr8si438590ejc.0.2021.10.22.22.57.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 22:57:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MeBPe-1mL0Jl2SnW-00PwKi; Sat, 23
 Oct 2021 07:57:51 +0200
Subject: Re: Building jailhouse images ultra96v2 issue with crosstool-ng
To: Paul <paulwuertz@posteo.de>, jailhouse-dev@googlegroups.com
References: <fa5430fc-1e41-9e62-1299-107f0a7cdb44@posteo.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <7312e55c-26f6-67a6-ac87-cbe5f640a111@web.de>
Date: Sat, 23 Oct 2021 07:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fa5430fc-1e41-9e62-1299-107f0a7cdb44@posteo.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:MPmJ2us0pQ9FCyS4bI7wTxoDc5QglXAzLmLLGD7Rp+NMdBdxkm2
 d91zkewYfDogEBGBvIqRQucUl526r9L69ohyaUy3dP+MyY1JdFy+vFuwFn08Xc1AfaCzyAg
 NkM69HzQB3uzC8nUofoGTEyf+kc8GuxbcEvAcFpB6LA3jtjQQM9yguVk6ze7iZOVId5uwP7
 dOmTQsSxzytZydjygM0+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9EJ5imEIElA=:3q5mSXMOJF54BQD6oYbsGH
 Vs2gHQ1gEbnwuMNQ83pe7s/JPsQD7+irBeFMtvpKkdsAjInvup92fnTjDrAUTha3VepLX3oiu
 cmNblGsiJTM61ApQrAnpFzKFXo4FnxhyvwB5y6GtZN/3s2OxBl8o1rpHKK+66Tj81sK6rOi4V
 PeyWK1+Aq51+n0Ta2dzzqM4tbut6F215dQUX76YGkenKIe482Hqa1Q2n35JyH7s2Tc6gOa1e4
 zBpENI+NdPQ+1SZPbg2qCuIhoCUSUHwFPA+sQkS4c2M29WW5MYGcp/ZCGJJp818hUlhyFNSHe
 3gC6YpFyK9tT9q5FhvHykud3mi/ok6pQiofJIG/E4EExE9zxY4Jq0tXu9YEcNyQB/I2qKStNg
 Rruocr/eiixmX0iOjDNzO1HU89tpg9ZcDVMc+BAFZWQCIdZfscWNXz2lBGy67X2Um3ZaHxjzd
 fqfOZK2X/SrEjz7KXQu+8BEZdoDP1Us1JiPNpE4zDq0NUy13e1qgmiybwQ4sW7fp8hoWTj+iB
 FHKyxg5ba1rfl6pXeqLhOru+fzXwsjroUyNgABc0MQ2r0zQsM8olgmfju/xMpXNujcVOeoD5G
 AhspfnNPU/upFP4KL6LiyYPZGuuaqCvEEbU5jPeVlbjqW6s+6hSw23KrkqDlHryEf3vrEYtz3
 Apt79V/7u08y4tINHR2h+z3wtpMt3L2Y094zkzUnfOd0F9ulK5pKPz4Y4IeITxo+ayK7Eg684
 oMqbRlyMELqg0cVajWARDVFTZPoGIRB45LC6H2m4tfz4cp/A7uQ5U9mebiuWqzdIfsAvunnXX
 VeGrhgoREDVnxxqWr8eoXfhrfPefaaznyRuWxh0qkkGqg0FEwBIvFToB4v57/HMCuLBU7YUSx
 n7Is6Uo6pFytxHwbTZyyOfEs46vqvKgVMvPZMNQOOinFFom7v6y8zllpOSAr9ON14Jl88HZ+F
 4M3tIzRGdxvy67u6ncTykSW3FuZZvj9B9wv5cU8meabsmlAjcSPzYh+I1VXTLp8X3ANCiJdQH
 oi76ExRLSnKgizPleljuvdu2hsT3hTvMz7fmXTzk1Du5TWqoRMSkMzMxc96KU/Dwc+8zLguAe
 toKJ2qYhCxFYgA=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=PXewIU9N;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 21.10.21 03:09, Paul wrote:
> Hej guys!
> I wanted to build the Ultra96v2 ref-image from the jailhouse-images repo
> and it failed for some error in crosstool-ng. (see below and the full
> build output is attached)
> In particular it could not wget the isl-0.20.tar.gz. Wget-ting it from
> some package mirror manually into 'build/downloads/crosstool-ng/'
> and repeating the build solved the issue.
>
> I found a similar issue on the crosstool-ng github issues[1], but
> I dont know how to fix this in the jailhouse-images repo, and did not
> see an issueing possibility on the github repo, so I write to you here ^^
>
> I am currently writting my diploma thesis on offloading critical
> real-time task comparing co-processors, jailhouse and FPGAs, so thanks
> for the work on jailhouse, seems like an interesting concept and I am
> looking forward to learn about it ^^.
>
> Greetings!
> Paul
>
> [1] https://github.com/crosstool-ng/crosstool-ng/issues/1609
>
> [ERROR] isl: download failed
> [ERROR]
> [ERROR] >>
> [ERROR] >> Build failed in step 'Retrieving needed toolchain components'
> tarballs'
> [ERROR] >> called in step '(top-level)'
> [ERROR] >>
> [ERROR] >> Error happened in: CT_Abort[scripts/functions@487]
> [ERROR] >> called from: CT_DoFetch[scripts/functions@2103]
> [ERROR] >> called from: CT_PackageRun[scripts/functions@2063]
> [ERROR] >> called from: CT_Fetch[scripts/functions@2174]
> [ERROR] >> called from:
> do_isl_get[scripts/build/companion_libs/121-isl.sh@16]
> [ERROR] >> called from:
> do_companion_libs_get[scripts/build/companion_libs.sh@15]
> [ERROR] >> called from: main[scripts/crosstool-NG.sh@648]
> [ERROR] >>
> [ERROR] >> There is a list of known issues, some with workarounds, in:
> [ERROR] >> https://crosstool-ng.github.io/docs/known-issues/
> [ERROR] >>
> [ERROR] >> NOTE: Your configuration includes features marked EXPERIMENTAL.
> [ERROR] >> Before submitting a bug report, try to reproduce it without
> enabling
> [ERROR] >> any experimental features. Otherwise, you'll need to debug it
> [ERROR] >> and present an explanation why it is a bug in crosstool-NG - or
> [ERROR] >> preferably, a fix.
> [ERROR] >>
> [ERROR] >> If you feel this is a bug in crosstool-NG, report it at:
> [ERROR] >> https://github.com/crosstool-ng/crosstool-ng/issues/
> [ERROR] >>
> [ERROR] >> Make sure your report includes all the information pertinent
> to this issue.
> [ERROR] >> Read the bug reporting guidelines here:
> [ERROR] >> http://crosstool-ng.github.io/support/
> [ERROR]
> [ERROR] (elapsed: 1:52.98)
>
> '
>

Thanks for reporting, confirmed. We need a patch to select a different
source for that packet, or a bump of crosstool-ng once a fix is upstream.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7312e55c-26f6-67a6-ac87-cbe5f640a111%40web.de.
