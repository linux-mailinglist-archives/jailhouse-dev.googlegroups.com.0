Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB3WLZ2FQMGQEYDCMVFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 682324381FE
	for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Oct 2021 08:04:31 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id p10-20020a056512234a00b003fe188e9960sf2822548lfu.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 23:04:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634969070; cv=pass;
        d=google.com; s=arc-20160816;
        b=MKKGxBDIJ5l7jDsooVMfej8wzKP2b9s3H0nHsgDnVAX8RvJ0vDdSNd6rF2dwKg7gTV
         kt9G4Vx8J8K6zva29AV5rJfOlsaf1+GPpbW3aKs7crhxhMDTN0u7vuDbulqBjZpn8JUl
         Pju3kj86NMwER8HV6Rid7gkjDyMQ2nCbPBouoTwQJY0uLKAaY2SZAcd/XjULTrwih8gn
         PO3q4xzRAAt0vnZCvXnqRb83l1oHhi2ISmNEOrP8gGUjo3R6KNlkx11iGS41eANMSDg8
         DSZoLJwEAk3+7VVOaXLGYzsAwDEDNGTMv3YBcNy7TpSpS6ILKkvmeVIjS7yBIZ1/+6zK
         YOGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=XX+/mQliPrGPOywr7X3UUr8MVB056KJSiiulqYQYtGw=;
        b=hHVahRkrOva8OpzhckMQQALMAvJ5p7Dz7bxE08SI9Mo1zcrgI1QJcW51VvcEvugDw7
         HieIlA5XKA9ZIl9v1EH1vUI0E8OWtxhdv2ofYmuMHLLzuGe/c2I7qX31RXEp09EYFGTI
         1I8MuiCNi44lNr3Mf+60nf9XwYXE/BtM5DlCi4V0ZvFkzjtPcmPcO0my15ot82m+RdQP
         j0rwHX63xo68d7+3uL0bICSCI/U7LjOUuRrKhPEsMUy+ntUFtP5t2CWzlhoGKvux62GI
         Ovjz+JcdAWfwg6fOHyjFGIaf2agsFJNOhyV1NdXURWAxYt4Wq0YMTMd93RJH7EPrvl7p
         2rmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cSZy13Ge;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XX+/mQliPrGPOywr7X3UUr8MVB056KJSiiulqYQYtGw=;
        b=ZuGawYFepwTIXLPgnxlh55X+0HES/YIQRqbSFR2tFSUcHfyk44KmE8ON8CDnSq3xGT
         VlikpIcU67huf4/nxBmz3xV1m8HDjHLE9/dlZ+U1SqphlzGUKZvOawEmBdLr9Fv9RZV2
         oVecj40uNqSERx5tamP5ikBzLwJc1X/ECzZacwM1ginw+VoG21tdBWWbMAPpKp9GSJkv
         WbZhnrV9vwf/vH5yuI+NeGx3HmwGTRFZf15APIC8r6AECsO+BZv1sr59O2fMYtc29dQ6
         E838IgQZJ9Jiyj6eMpG4GwPr04MJA9je7GzLY2r5Co6q1b+MO/3/lSMJR+YlunYOi0f5
         AFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XX+/mQliPrGPOywr7X3UUr8MVB056KJSiiulqYQYtGw=;
        b=qDbdA/qS1gKD9aKaZKhWIsiw0zGj3CgrGJmIOF5vXEqP7Hehs+C3w0VMFh3UqEscWt
         dHYVmqqL261nAg0n40gf7VJA34N2DQ9rUutu0Udtwkth9lEvFPWSrz0564VZ8tgK6itN
         tHHfB0LaivGuKjwyIC6fAnjeOIvIrmfCi+WeB3b4R4r9zC8i8JZkcMfnDXo6oRsTnh5L
         aDw0ptCZs6JukIulz4ZYK6noptuPqgxSa8wIGnIoeF1jwWdXpMAJF6Lv+iLOVo7olf4j
         4mO28zuKUTXfxeQsNV5UsoQb+NqWFf7KcPbKOzeG5cynissCgP89paT9Wi7MX7BNJvGD
         CEfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530qfk9p51QdnjCZXf4KmGfIDcKWkenkK8Do9p+7Zt39C0Cdi2aC
	C4FsUca5ugmyHM6lTjeqiYM=
X-Google-Smtp-Source: ABdhPJzSVPIt2f+WyqFBu0ULt2rZT2s9SyzDmlu59TnzH5Irv7W2GDpYwkloDYm6U9gDGWan32B+cA==
X-Received: by 2002:a05:651c:1506:: with SMTP id e6mr4500798ljf.129.1634969070681;
        Fri, 22 Oct 2021 23:04:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:b9c:: with SMTP id b28ls4146233lfv.3.gmail; Fri, 22
 Oct 2021 23:04:29 -0700 (PDT)
X-Received: by 2002:a19:7903:: with SMTP id u3mr3809345lfc.406.1634969069805;
        Fri, 22 Oct 2021 23:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634969069; cv=none;
        d=google.com; s=arc-20160816;
        b=UrD5RSISHnflY3/P3ND/shEjYW3S3BeYvC9rmnH3pyPafg1sOdoJvPr2L9GlUgxt89
         c1CL9f6N0ak86VaDBXx9HIDP3rb/NPTb0mv8n2QMp2fBc6op6aYikySDRh/xNT81j6Gu
         HdG2dVaNpV+EjvXJ+H0pZR4rbsL+4tXSIgba2X9Wuo0leiWX9pKtX3eZksBx1EEqzfYO
         hGeVnRw7+bTj4L8LYCKkGi7u1AmC3XGnEsmZDZZIYiWFgYB+qyy+ElbWwqiDcJx80USE
         cPocOsEsjh/5IYHvsPCc0MOx8V8/aRY/N4jA5k2mIaVrDdYgH7XQ7iNEMYcWa8893fL0
         Eupw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=/CT8RPU+K5upfySUpddYbddakZbRiPdbDlCqzuZoEV0=;
        b=hlG9yq4QFynkwnM9fdxHCuqQJ9w/SxGLa3fU9h27zYE/poLhHZ0TTbElZ+HHydUn2R
         oervPTxZm9QubaUp2ZSJdZ0NMe48QcIF7A/7aUqtg1dQQdbva/U41J2xR+pQX0UbwvS4
         VzNxx0l0hFDOyA9o4bwPBFKNXZFCwHrVsY7gWBBedI+GzyiWpGqgwzPHl00Kd9cQSIcY
         BlCrQZ7kGrLtOZz80gz3wS8zcDLifI0G1YN3brD41ri1zPYkK/hG4g2PKhOFJB4mKyrN
         ePdEC9I84rtogoNkPFqfEyuAA22JB7Uw4g0iVAfzYa4p9giMXvD0sWivv5PuRR8XWbBV
         eI1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cSZy13Ge;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id z1si629349lfu.5.2021.10.22.23.04.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 23:04:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MMVpO-1mcXJa2cRC-008M6b; Sat, 23
 Oct 2021 08:04:28 +0200
Subject: Re: how to enable real PCIe device with MSI-X on arm64 platform in
 jailhouse none-root cell?
To: Changming Huang <huangcm.huang@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
 <e282cac2-2939-b868-afef-7b266b251e50@siemens.com>
 <5032fae9-5e5c-4526-a777-94ede22ac17an@googlegroups.com>
 <43b81a76-02f9-204d-059e-03aa53568d2f@siemens.com>
 <8df72a54-3bc2-4f81-8b20-9679f518988dn@googlegroups.com>
 <f8ae1dec-47ba-43f3-babf-9de6e66709cen@googlegroups.com>
 <be28902a-8cd0-90de-e23e-37b42e59cea7@siemens.com>
 <a93d4399-0a8d-4448-9a94-5aded67b2e3fn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <e860f06c-14c9-4399-6291-1cef96f4cb7b@web.de>
Date: Sat, 23 Oct 2021 08:04:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a93d4399-0a8d-4448-9a94-5aded67b2e3fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+13AsA4aIUCNox/8+1IdF5eLLY4IwIzHnabXu2hd83vNE61o3CR
 SPtnjAQsXgRTzxF91Jn54388h/oLBvxHMnseJU61LGkjjcmvnXm0qeRRQ9qq0WJHgz5L1lG
 mw76p3zPXTtg/IfFUvWVAPT0x3feu5z4gRIOw4xjqV53FJGRf3N/M7PvN/TJHQ73y6JwwOe
 3V0/xKkHu4kBXyKdHzjyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qBOKRf2Q8JY=:68Dn+2ymh1YkW47KjbuOnC
 Te6dXiuoE24mXcsMw2oPZPEQxHbKaNClhnbtBIlaVvTVhsDPlvY9ggmstZ19oTHA6q1g4OEoK
 do9Xc5lQMuhmM5hmbmnZbGs5XdeJtqUNobvd7jgaGg0MPCw+zDe7SooSla6BYLVRkQ05wRZoH
 vIppViY0Wxr9SscLy8trpKFALUqPTk+/RVjHRAxcz5nAtfPE12DfJIWm8bakXwq8BiGiB2sU/
 xJtcfyICje+U88VhuC79E8zKTfIUmhehUFbN9poACLrd5ZIyay5rAH/Uxm11GhMHbWt84TlXg
 YIQ5xh0t4t3fLhKXDIwNMxr7ELUfgXhIIx//VPswZ3xDhN0B9egwb5Elt/pinYgh9nZnO7ULp
 3Wd6wNBkaNct5OkpNbxpnUu+IweAUOVABeZ6Dwmb86euIe8TlvYCiGCudSdy3o/lNKBZBK6uw
 GkL2ds5EcdlkBH2H+vVnjlE52th/iFMbg26SwKgu80WA2iyzFzj/a3EOWcc4lyF+EDacSX20y
 LsXavnZxEstnj6UHNmdA3xLqAjZVSLNeZ7Jr2/iw8rXXIfj3VT48j9F1sUU3EmrPmrCWFnOgh
 RzZBQxsR8eFDGUSfxrSALoshuSK7GMGxDm6VqcI1wvMziSna+ltFSKo1RR2a4MdJUqkTQRerC
 n9pjaxmUmsocItduPcNe/9aAihG/wZ4OQ01U9L+3hzQz0nrglTncvL3Pv6lK7EuCC+0weSLcG
 ve6Eq+mXqploIkvbN7ZdCtBV2b/9x6sV3/cFZZ65kQ4rHV03zkf28iFyAw1EeM08rlp4XWl1u
 yiIW2YuMV//wkfFCwQEAvrNuW51SaFPz33GEVMlrIVN3RW9nR8sSrxMFp5Wab4Rcs6mf4rkoL
 xZ5ba/lyQn+BgQEXeSkkWkzb4zH3Eug/Bz2ip5y7FPHf25RNM9FRhwvHe3BfGsSvXYb3IfzC8
 nhxl8eqvSsPAllWCKcL7QTR/CDgfF3oRssDPjK01SdUzQtam9xJdpNaJ7fTg16Ao3p14yEUFW
 xLn0Bhf+2nibD9Hbe/WGoB8XdWLXcF4b07BS7hs9iPvYI+YiBGY5CaOMnWfP4bzaadk28GjOd
 iiKWxnWHZRzK20=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=cSZy13Ge;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
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

On 18.10.21 14:47, Changming Huang wrote:
>
> thanks Jan.
> The LPI need one reserved memory and now I assigned one to it. and no

Which may cause conflicting configurations if also the root cell has
access - depending on whether there is something configured there and
not just read.

> call trace now.
> and can get the interrupt number, for example:
> 96:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0ITS-MSI=C2=A0 =C2=A01=
 Edge=C2=A0 =C2=A0 =C2=A0 enp0s0f0-rxtx0
>
> but, there is not any interrupt generated.

I don't have an up-to-date picture of how the LPI ends up at a local
GICC in the end. Is the GICD still involved (that "L" for "local" in LPI
speaks against that)? Then you may also need to assign the related GICD
interrupt number to the non-root cell.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e860f06c-14c9-4399-6291-1cef96f4cb7b%40web.de.
