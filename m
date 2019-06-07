Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBWFG5PTQKGQEWSSXFSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id E545939773
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 23:12:56 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id s5sf4952515eda.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 14:12:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559941976; cv=pass;
        d=google.com; s=arc-20160816;
        b=OZY76Y4kDpQBeD1G/fn3P1ML6Q1RysOpRuUTvaL04bYP7a3i9X1wNiYyytlnjyPRDw
         QRrM1fQmcvSy0G9hg+yDCVgnrUm2A69pgVSmJy1EGslHcxPTh/05OOowMTKYOTMGud3s
         w5jqiiAc/LekNnyrtiCqcdhsurgT29zlKGtwuV0dC+d7ae718y0oeUfpkgkkIb9PANfz
         unO+SHH9ddJqPiWPMbVQ6Ck0/x+ahR4xv70cBNXDlFLLfiC8/18UqVQ+Z8bV7iz46mZH
         0Sst7HechyBW+w2bZo5fauKXrTMd/a+AKHeGvdbQ0wSLnw/GBUrbhBVLsw52JuQbnOZT
         6MHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=JghpRTqsBgoaKvscHJylX2HdkQkFAmXYV91xXAfjp14=;
        b=lhdGOXoxXEfX41+1UJvzq6PzLDHJpWqSj1z7GrGJ2Bc1AWhL2teep8b2GJDlZhlKUf
         bcXRd2Pupnf9HgUFRY7X+qRI7vxu5NvFApTPaMcChP/QusIc/QMl2cAd/S25RMkZenBE
         8Lmu3VUrlZ97Il7mDNquonbWTvFs9tHVZn6nIMuNXQP0JlPaXdhSlgoi9a2tktRAV/Tw
         JQL1uzuq4+jgkOLfBOaZx9o9EVYyU1KtzGVVZ3Gwi5l6eD5Pjeto1s5LdDSlDuIvQ438
         u8XMKYtZ5YxIjGiVMy7WWczExy9H/JbocOBAQko4sk+dMsWzX1bjs3HP6LKCMs1BdGLB
         x8YA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=J3GYKsXf;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JghpRTqsBgoaKvscHJylX2HdkQkFAmXYV91xXAfjp14=;
        b=Y+031DMuSWxGe8LnChW/yZJKRYzz1mTXI4j4w/enn0kwTr+viP/Gl/heaWiYiEJOKy
         GHcRp23xk4Yxm2PD2Slo+3uo+OxCeYSBAup8iIlTIEKgnEEgTVtMt7c3vCFOXTjQDgJV
         G7mNeNm64gCfvLn1C6Nt9HzBM8vhmKPaQwUOFde101kKNUDpPJqpkDlysFd+hz9i99zH
         exEdpLPyTNyA3MmDOj6was6exe4NTCqww/cB8I62cBzj6q+wJGdb8We6P3Gv6U5gCGB1
         41u3Rx/SdkpbBy948F62AsUy+UZ6JeEKeetn5s9tP8WGozNXsHvFpXONBseKSpSspTGO
         RTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JghpRTqsBgoaKvscHJylX2HdkQkFAmXYV91xXAfjp14=;
        b=Pn2/r/rlShTiugX2BhF214b/f6avi9a+VN88EcvknfxAZS/LpcoL9Whq6xu2Z1SEtu
         RC2RAldWWyTcRLZumT9KIhUau3iGw9S1OajtN/2xxFrK7RnNVBG6tsuVqSBIg6BIYvK1
         WPdKxtU1dElVRZhQxfsQ/XHSdpKBSf9/iKXgUaHt+90TesKJuSMEIYLqT8lMbuXPY6pN
         K7323W4tQySvH/KhTwrl50Kf6DPam724ANbRyQ/KNHXrg6PQ43q+fwNM7vdPcsecyYPu
         s2BsFC/yQvpkJgLsiSRb5lxmcECBzKVQBpApZOJDPmNP/awNWkf9DgjGpIwUhvrgQoSk
         POUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW7sfv4IfFoDD3wfYncyRFdBGU/2may9paYZxmXSMlNErjvy7tD
	A5fwRk7j++kyrsy+v27jxBM=
X-Google-Smtp-Source: APXvYqx1cmx42Yb098oG96Wm4jm3ydnw7SK8Rx3AgxhEJs1oWQsvfVvKgo533WNidlwVxzhRSpllfg==
X-Received: by 2002:a17:906:2f03:: with SMTP id v3mr22891554eji.219.1559941976661;
        Fri, 07 Jun 2019 14:12:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:cac7:: with SMTP id f7ls2903337edi.4.gmail; Fri, 07 Jun
 2019 14:12:56 -0700 (PDT)
X-Received: by 2002:aa7:c919:: with SMTP id b25mr24020080edt.274.1559941976125;
        Fri, 07 Jun 2019 14:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559941976; cv=none;
        d=google.com; s=arc-20160816;
        b=VIr8LtSiZUnL2thf8oKGPLq7ocbZTPrWNZRf0j1H1QhzTbW+kz1jvln7qiNMijfW2T
         D0dJdrue8WVrUxKt++lgVyyXDK9N/gWx1LNtcl2uitFW149umDYlA6cWTqJE3N9lCNK7
         l0rA3UBz3qWYtRE2F9FY1MFF8jfUOeDUWUvWRZv4U45ujKQK9ZjrfSkCB1ubaWM7xQGL
         SvLjv5bMINJWKZs0UcqnjY01IghpqIBrmgmBJdcczlAc4zHnw6q2ktJnHmzFPFyFcQXq
         iKtXsRBA+sTQ+X3oHXN2dWml6Ejs7sTpw5QD1gwOFUHOaixXBmTPQ4UwOtAxDanCkqa/
         irXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Trmb+3Bj/SmW1uuAlJY8Ovc80bUDxPLqHh660Y2sqkY=;
        b=uh1IYdB072a+gLf8UcOFZfNQbX6oinpHdS5g07aJS2wh/Ytby06jpo3vVAFToKT/dL
         JNqW3RxBR5d803Vy1wMTP2bY8eUvLpzjGENIRCxubyNa4ZdFNS4B6kVr47njB8dHiGxy
         V6uAYADY0RYJbrjk/iWmgrpFoapRubHrmre/eA5/io1zmjUV0Yzi9WkvN3yvWtVSEVv2
         WhTqtJ5sII9Hb5AGUuvoBd5wmnaYDWJAB+fBocfBIAgCKarGPuNVdtQDa+Smk520CXfd
         ir4HwO/wdFdA75zuU4XzdJmFrOpMcuViSgKM7LZ0NLIE0pf87NA9sCfFZ/Kr/DLyUZf3
         d3QQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=J3GYKsXf;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id x27si212035edd.3.2019.06.07.14.12.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 14:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [10.112.120.183] ([193.96.224.60]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MLDEn-1hZd9L3L7J-000Jlh; Fri, 07
 Jun 2019 23:12:54 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de>
 <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <e4ed0785-7b39-6296-5388-c938ad30f366@web.de>
Date: Fri, 7 Jun 2019 23:12:52 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pVvXLSvqx2NaKUWEWuQCd/kn5Mj4paEsxh197v/ekUw53Ebc6p8
 3KBhND/vfhT3YI73RYgY7X8IDR8fzdS192fSQBWPybHq7sjX9DRVBICJtylfN6dU3EQ+BFq
 +hBVYZIgKyiLDNHjVstxRzh1bjbL1vOIKkYHg4bnR7oAX1sDshRyT/HqMgllnFpYYwRA14p
 eHP1IZUB7MU3tHOoyLzXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9GZz/XcMtfw=:+lIgH3mXKW8fIM9dVp0H9N
 zmctAV+7Y47EFu6BI/IBj2gphz8jmf4OONgdwEG6oZnVN6E1Dqxt/SClYhzz1ZhP0QqZ/xyoK
 wNd+asfW1accrCUf2q8BIeEh1ACdN5OQb22Z0yXMs2hWRNlWeMoZgXz5QvsfeK4yskVxalv6j
 MGZnFteCqGAnsg1eXmhdKsYCtGX7/WhEJIaLVWqRQe4hJIGxb8QyMixgKmkrOzwgS7bqZ+CQ1
 qPLq6+6YMcjOfFMYVAZj16a0q7pdLLrkN2VFc3JxFiDVa0rLrokDgxwDSBnaa+Nq6XanlzKki
 4wLCRpfsz3sOZhcQo4okRLL0II6bao/SxrUq9UcnNKHLY8YKy2ipYoiPnBc6Q6h+srrMPJOcO
 5WZlPUFmeDeLK4Af6/whDIZ5qLqePOwZEGYjewgv1kOlIXqBXNuUcSivx8ttWg57n5ata3R75
 BprHiZ2xJrb81xJydvAW4T07noiLHK6zjEFTrDO8V1nTKESjg+X4A3CBhEhl7ic6SG9AnAxzE
 17nH+E7udkEHCCYlbPpz5BsXhnHtmrlX7VSIdQhWhuSaEyslFF5Lir31zS3lIIsUvDpDhtU0I
 zAMsjWV1IDAS9a0MfniZNGNY1XH8uAExxusFRXrhUzDUl6e/P3mqEv4LmREbRtCHTHCa+yfu4
 zD1gBOM2IkkAuEMohFwxdksvVJy7xz++aKcD9z+rYwvy9+aX0U2oXU7dcu0iEIOZF+CWTd/Wv
 /Jf4CUIZBZTbnGjW2g3iBkv87IyDp8ZYW6S+jJhj7GF2S/6R3NUnUd/jpN6RLyihU46UJCtLd
 wkakyChO/8OKWKPdmiQSdP/hv5b8SeQYRz7/MPbwDfAlhbOMRInTrlFMnmoDyYPTo+UEU+/uJ
 C5a3HUw35Xec+f8L4LplgdpRWD9KJ/0mOwxytA5WzUT9bxeulaCYK8pdbSHQvD1fuxQA3MtM5
 0Fczmo2YEFk9l5Lh4/UqUokdM+sNb0flCCc0T2x+FhlAr0UVtz7CyRiioa6uiE+x1od4x8Fzy
 5bUrnJ2VKDj4MEZnHNu/nXY=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=J3GYKsXf;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
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

On 07.06.19 22:04, Wayne wrote:
> Hi Ralf,
>
> Thank you for your responses.=C2=A0 I have attached the requested config =
files.=C2=A0 I am
> now just trying to use the same bzImage for the root and the non-root lin=
ux node.
>
> Yes, I am using vanilla 4.16 because the documentation indicated that it =
is the
> first mainline release to officially support Jailhouse Guest images.=C2=
=A0 Do you
> suggest that I use something else?

Yes, definitely. We have 4.19 (which is even an LTS kernel) pre-integrated =
and
fairly well tested. Ralf shared the link.

You may also want to have a look at https://github.com/siemens/jailhouse-im=
ages
which generates directly usable images, though only for two x86 targets
(QEMU/KVM and an Intel NUC6CAY). But it contains a lot of patterns, e.g. a
kernel config that can be used for both root and non-root cells.

>
> Right now i'm just trying to get some serial output from the non-root Lin=
ux.
> Hopefully, I have that configured correctly.=C2=A0 Ideally, I would like =
to share the
> same serial console for the Root node and non-root node eventually if pos=
sible.
> I have been OK with using the virtual console (jailhouse console -f) for =
the
> Hypervisor output.

The virtual console is fine up to a certain level of problems. And those st=
art
when you lose the root cell due to an access violation.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e4ed0785-7b39-6296-5388-c938ad30f366%40web.de.
For more options, visit https://groups.google.com/d/optout.
