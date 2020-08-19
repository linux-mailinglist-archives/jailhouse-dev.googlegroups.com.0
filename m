Return-Path: <jailhouse-dev+bncBCONRR6ZTUGRB4N36T4QKGQEBL3V3PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F422249E47
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 14:41:22 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id y6sf3819062wrs.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 05:41:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597840881; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZpnlXarbD3NAtxSu6pvfHCwvJLXzeoaeDCQ/06rVNLhGZrkIYDq1icmgtYFm6lUZa/
         PlTkJmwM6g29P2IQOFCQF4oTOmg1XGGaHkGyld9Sj+GWxlCAZbUmqYJFzuv6KVQKml6B
         p8T40WtavaCyJ49nxdn8KdISFHjmhkUHP2S92OAWPkVsfzbCFbK+L6kOTvxFS0wxutTO
         L6bJI3t+yNGmwYFlcQBjeDwa7N+Tj033GK2MdVSywCRDIKEpaPJKHuHwQfrcFQ/4E6jD
         z/OOyTMo7i3sSNLV4xnnjGoxQPkeM0dr15z8cz701pyI7tgIe/oRlhREx2hRy4PKdy7H
         bfjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=yKHCM/5I1VT8/9cza9ZPzQjQo2q4c+pdZgTE4Px49mE=;
        b=VES/Qd7UoZRpy7mLbFZNR+0eu1od9fv+B6klXo0gn3ExIMhp3cYckwCXokhezHLzK0
         wob7jxBUkFQhcz1Eg3MAjirvvWQJxTVS8o4XvuSzvB+dluRoWXdeJCOG5SFyyfvL8Hqe
         muNhVAkZuvJm18gWuFljJjGl1Zk4ALk7RNg/YFKsYXSr6Ukduvwudgi4lGlPktm+1IaS
         QGE/MtnT4pVKlRtaCCiEc4pKUPrun1cN3xfyfoKv2t0aCJoMNqXfF90B1sSj30Sx2KCu
         DoqOVuj4k2vDlBIbqyrR7xHEjwhWS44nWzVpXjH878W77R4PD17hseG6zk7MAtOTuW8J
         Jf1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.213 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yKHCM/5I1VT8/9cza9ZPzQjQo2q4c+pdZgTE4Px49mE=;
        b=G6brWH67w1CsS6HBxQyZJr/UfBqQ+EVq45k74jg3tU93gvcUm1Fqir990WwlipocGq
         OXlH62B4lZ82ZjnQVvjC7BXRuMpDOk+tgUfr11Bb0JpayTs57A2dctSJVJYsRgIYOk3Y
         GAfVCHbJxe1OUg7kn39/Rke6d4uadhuPKI2JAIk/CPkyUf1lxrh29o/7cyhArwEamdbn
         pIfUtZmL8gj/+kF0K0oL1p9LJx0lRZ3NrOTYKhcN8pivFr7jDd05hhFvJ7wMMBL1qFih
         Y1t5MwM8dC+r00gQJdq0mREYR1Y3kBSSyNndz9FjvANZ7MUvjXgFR3z/cWKnu7lI+quR
         ztfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yKHCM/5I1VT8/9cza9ZPzQjQo2q4c+pdZgTE4Px49mE=;
        b=FNcn/n3GbAiKUhx63DAxR14EBiR12vkzyBu0qulTl9oRZ4Cfpl2OWGOAFA4ajhZJQI
         DBJSzJbOSP3p4TjgF+GfifdJHA6tFcyar+Zjvd6WeUZiHRywxpZmTUGniZGOuzHLbqSb
         6Oabbf0MjBg7oHn+H52QAAlEDokLTZwdPVasrSnClxETqbfzGyVLVo+GoiY9i7BpzXJ5
         kz5bC6LVZYNrOV+DZZUVczGNdXBuo8WZZez/evDr/2unMU3pqr1/jRBVLXvcNqVxodIk
         cU4v9WUpQcfpf5srbtwkVuWkVSq9E29QRdnb7q5kFDPOx065VUxKF/lhIxd1VXoBuA0k
         OOjw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531C9fDVJJIVhzzNR/YsOV8ghqtqyHYDg6GdepZjCQhAwolcLOyh
	pJD+AXgawWP58DZA09Zd2dk=
X-Google-Smtp-Source: ABdhPJyDGd5aZBDlPRMK6fIPw2MEwung0Ru57STk1xCpHhZ0cxWmZWTcmhZZeJXtmVUujdYqGmA9cw==
X-Received: by 2002:a1c:818e:: with SMTP id c136mr4966395wmd.170.1597840881672;
        Wed, 19 Aug 2020 05:41:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b787:: with SMTP id h129ls1726167wmf.3.canary-gmail;
 Wed, 19 Aug 2020 05:41:20 -0700 (PDT)
X-Received: by 2002:a1c:b7c2:: with SMTP id h185mr5133644wmf.168.1597840880827;
        Wed, 19 Aug 2020 05:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597840880; cv=none;
        d=google.com; s=arc-20160816;
        b=tHSeU9np+qPBwSfWx3ICzBQDxen2g4b7z7ULFh82CKjOTBbe/42U+J5Dge5M+1grxX
         SIHL/aM127NBkjIstdcP20JtOOFa0Prf7WG+RY8PRQhPaIh0dmgXODSsppxMzGDV5iea
         3uWIOs2xIPRdF5t5OZzlT2YUokzGlpilxQFNgojfXOQZittSjFr7jIIUcK2gRQQCdG79
         KErEvmNUnTJWG9mXO4dtKFAFxuFwIUdMseLcMn91oDGQ8CWDrjmItmMAgpffsidDhLnP
         3SbhcLqXwYA1z0RwufiFxLdrkqvQ0UlbBzF+7TDsqnHoSLgesOUbNHjrwsgeLNs/2Jge
         8S0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject;
        bh=sxbA8Xzwasv2WDxcxO6Alg3shCbXgqtB1/ChZpx0YC0=;
        b=JwLjs2UMk818ZEfOiTBnxpzO3dZINoMjtHV1X2WS/FcJY/ruQxTcH2JQuwVxt7NGsk
         VHd547DDRmn+Ij8K9frq/kmDZ008M0ihgiuq03QodOT/Xk42USxMK2tjmLU4lofFaIpP
         yOATm4OIz4ALYIRQMdvbe9luHAtUttvcQiPP9pPYefMaWnGfUnu/+9b7F35naW/QPeZV
         MrJbnJI6DLCfZQpPMQpjTfyc6Aj0M+UKjMHp/Z+zysDG/0aYH5+bFjH+5ISSlGpckvaP
         aXV0mtongi+FCqYC04LdZm/IpNlccWfQEKhD81TspRrZkrjjpbdouXgYmodmOBNNAw2+
         8TWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.213 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
Received: from mx03.uni-tuebingen.de (mx03.uni-tuebingen.de. [134.2.5.213])
        by gmr-mx.google.com with ESMTPS id m3si134854wme.0.2020.08.19.05.41.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 05:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.213 as permitted sender) client-ip=134.2.5.213;
Received: from [134.2.14.31] (tichy.Informatik.Uni-Tuebingen.De [134.2.14.31])
	by mx03.uni-tuebingen.de (Postfix) with ESMTPSA id 8B3A0881EF;
	Wed, 19 Aug 2020 14:41:20 +0200 (CEST)
Subject: Re: [PATCH] configs: arm64: Add support for RPi4 with more than 1G of
 memory
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Cc: jailhouse-dev@googlegroups.com
References: <20200817171736.78100-1-jakub@luzny.cz>
 <57c67012-fee7-d7f1-1201-25415e39034a@siemens.com>
 <CAGdCPwtX9JoP_RocDeB-MF3XTz+yyrXYL2LBCOs_-xa_TVA6Ug@mail.gmail.com>
 <83d289a5-8928-0fc2-68aa-64df76e8ee16@siemens.com>
 <32baa43a-4e84-7f22-230c-bdc5fba33c76@uni-tuebingen.de>
 <CAGdCPwuAGqYaeUik+c1oFX=Zo3JmDmm1JdyMiYPPVyi4ovGvQg@mail.gmail.com>
From: Christoph Gerum <christoph.gerum@uni-tuebingen.de>
Autocrypt: addr=christoph.gerum@uni-tuebingen.de; keydata=
 xsFNBFu/bZYBEADBgSh0ErsV9JDgVRAg+ONkJSwzOEjyGr3APdvNM4HUcTvCzbQ4/9rFhAR2
 H+9eS4BvPi/IobI0HGIopOMP+xzkRcA1o/k1+zPGBAx9ac9QkitFSm6zAKRTTwyIH4l3cQlG
 LOeo8JhLZxJ5hdFA7wI5bAtOuPHwlhSjd2/0lueZOpPfafqNd0cK3bT4LYyclR1YdUwkBZqb
 aQvEmR9dQ9KCbvmBHSSq+HnvtLu5IWe1ysZSwcEadHrXNO5v8LgF17KouPeSfMeYxhkFSdAn
 jpbmizvHnqswUjBwPhMU3QCHj8EgBk5GFgmRdffvbs66OWw+FHXbQh6qreVj3+21/roc3fVV
 tR4froZio9iH5McW9wsfrtk+Z9i6eFZKfrB0pk/KHdIzZpiCpKjMTNTEeiqNoMcPt6SW04IN
 cAVxRFSd7rwwfiURQjKCC4jsX3gChAu8gi1EUVGl34S30Eo0YB3ZLXgh37C7T7d/fmJIVRfT
 P09Zw2J6RZvRZnqvmBw+dE3ScGKau6qRo8yz0mwrGU8pAUj34ojT45a6cMcnulfKgOpgVZuN
 FjHj5DgRWk7e5X+znMoq2tLTfje9DUe6L3ai9xebU9yCLi3ZpS+ur/1Sz6FHE/CP5GvXCFX3
 fqzg0otd0Bhf8iVuJxi/nAd8+p0uHfAQMPMx12EAqNpy820XUQARAQABzTJDaHJpc3RvcGgg
 R2VydW0gPGNocmlzdG9waC5nZXJ1bUB1bmktdHVlYmluZ2VuLmRlPsLBfwQTAQIAKQUCW79t
 lgIbIwUJCWYBgAcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEKPZxSUkKCFdcEQP/2Y1
 09RugeJPr5W8PNfxem8bHn7uV7ghDqToashngec1feN0nDEtkzEfjcaDTFfXA+1hUz8rnYXs
 5/7FFzojUZ295mh0UaQUHk5oH3LcF50fEtt1EO0GG0tMMzCULQaNcNKuNhfzVX4l+vz7zgpt
 c7yseyEyKblAINOnyBJlvQUAdS1OhgXszr8eUNAKDqJYhj9UCZO/qYGaCM56/2rsSfzkGVfj
 ExdCehnEXabLxYHYTe3dP61EHTW5p3Eyh2YwGxn9m5QsN+O5Fb8WZR5va5M9aRB0olXDI+tE
 4VsANtzWgKUkKnbLpflQS+ilseHQiv2KvDBAErAEfiStd+B3jI7d5f8Qj/0orUKwFhjFd5Yf
 w7C96klMtZnAF02XiD2YoMdmHFWYaJUH2yLyrqOs99LQmRQyvwaesJcb1/6VoqpDXqF5EYa0
 7qyVlctmW9d4g8vAntV5HcU8TzjzoUVxBSYElPF9tFbZW1vEz7qnIh4Z2ljCq3RNJdeuWc/2
 +UmLH/YckA0YIjJtycsikNxadoyyMlT2fck/8XfI5xugQIGRxaNnk9b60FFom5KUnYEU3XhG
 8iR0fogjnKhXGM3b2uk2bbFI/6Ty0NjWLMy89mXxH4HbrfXrGLTpFpSWnIG4DjgYFD1rzCdt
 POVIUbsxd6JMMlVQiwAB+hZ8vLihaFbCzsFNBFu/bZYBEACjMfaxdbyrDPOfUfH/YFw+caZX
 P+efPSfu7Q8zadoH3LHpfRPYsj9Q4hrGlMZH2H8XKagIWiuY8t/1Zc1RdV4WazNIBwk1jUst
 3Mq9nhDe9t57/E7BSaAr3Ce0x9eWL9ikaq7hLrzXcHt3bg8+BaJvOU6cNUvdWkjhAJ8CGH3K
 icQ/1WPa2qQiJWDUepytJCht8TaKHSF863tcTCG+AgkoKIwMopA0cdPRD50wGMHCGven39eh
 VM1C2SsuItGZQOGK9YtjgFgd7D0p6CGHnChwHfkJ5v8voTIYmvVDowglG56tdjKuRRZMJm0U
 pRT4oywcVnXCe1TEhdmq8xPkuSVgUkaZsGdgRCqxCTJefDvOmRiULj2jrntc/sUKc4yKRDGi
 OPgA6iKqtCXGqY+Z5Kxt01R5/kad7kckZ/5l6BwUGRM3vghKoHnSthR4cEMwisNkO9VUPbPT
 lhV7ApMzzUuHASxGBEm3bmL6+uEjRe7ZfqdCa6i6/3ISH0ytg1a9RnCpnj6QEJgEoTSzE7H8
 EcFtoYS4yzTNwICTVUtx/JH9ajHLmCvP4zrl+l2eLorKASuGSoGpL/THLT1q1oVXW7z2xNda
 lf3xGa5WrwoTfT/F+ez0m38J22N1E+m3zi3AXOrXLGxE9stldxPrl4TsHiL+QdfbDbx/tlbT
 6lxuSZ3JgQARAQABwsFlBBgBAgAPBQJbv22WAhsMBQkJZgGAAAoJEKPZxSUkKCFdbe4P/iWm
 Ao/IjHMgYR84y5pe032i/6P72cQahQRHxBg0dN1HdJx6RmVq899KvogZhF/NfLxB0MIkv0SS
 e16roKeItXN4MXO4jkOSUwEVsENYurQpmWpS/3BvaTAYjfeeyLpHhBFyThYXRT6LByOXB0vK
 T/DVBEQmKV5M50sjc0Y3vj1t9yWEQD05jP4avkm5yUyWvhyGCi4n2pqJrpTu/6Fv0JL5xgu1
 ANJ37+DCe4eBzjzdoCZ8KrQZTjBwLV2MvykRcu7wACpY7q13eikFmuXFjosNZvKHYIM7pp1/
 XpkdDJDnrmGx3ECU2U3GMiSudi5qpHWRPqDFNxA8N34graSIViFyZTu1uHnx9Ll27AA6kjYD
 scCsciDBpOH7tr5PG4R9c++WCk3e2RxsGV67l6dsBG2qPEQfB46JkDpMfEHBmjtbnorbMEG4
 5UEbZgYnJ3L81LlMtYy8curwdYCnh7npDS8+aZMkLM6Jx1Ffs5SpT2en1Fq8jqL5x02XGe8x
 SarP/LEcWzOF9Nf0JdVxsC4JWvDtt/aKv8uMt+G0kgCoz4vBZR5hsokVkX13RwMcktc0J+yT
 f7Sn7+AILpqE48h0sjsFE4IxtL7ew9US/qWBTvq0OZbjLcpz9tQdj9Iz24m2xjnk4lQqzWF0
 T29y/VTnmoSXIbqAbOajhVUuOH67EXAD
Message-ID: <07e0e959-4d93-58aa-4720-356d3bd7066e@uni-tuebingen.de>
Date: Wed, 19 Aug 2020 14:41:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAGdCPwuAGqYaeUik+c1oFX=Zo3JmDmm1JdyMiYPPVyi4ovGvQg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------71309D5BE73E4AD98ECC9DD9"
Content-Language: en-US
X-Original-Sender: christoph.gerum@uni-tuebingen.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of christoph.gerum@uni-tuebingen.de designates
 134.2.5.213 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
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

This is a multi-part message in MIME format.
--------------71309D5BE73E4AD98ECC9DD9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


On 8/19/20 1:31 PM, Jakub Lu=C5=BEn=C3=BD wrote:
> On Wed, 19 Aug 2020 at 13:03, Christoph Gerum
> <christoph.gerum@uni-tuebingen.de
> <mailto:christoph.gerum@uni-tuebingen.de>> wrote:
>
>
>     During our work on autojail we also had the assumption that
>     .pci_mmconfig_base needed to be below 2^32, but we could not find a
>     reason for that in jailhouse. I was think, that this restriction was
>     either caused by the linux driver or a misconfigured device tree.
>     But I
>     will revisit the problem in the next days.
>
>
> I have been looking into that and the device tree generated by
> Jailhouse might be the issue. When I move the=C2=A0.pci_mmconfig_base to
> 0x200000000, the generated device tree looked like this:
>
> =C2=A0 =C2=A0pci@0 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-coherent;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#interrupt-cells =3D <0x01>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-map-mask =3D <0x00 0x00 0x00 0x07>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges =3D <0x2000000 0x02 0x100000 0x02 0x100=
000 0x00 0x4000>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "pci-host-ecam-generic";
> =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D "pci";
> =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "ok";
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D <0x02>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-range =3D <0x00 0x00>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D <0x03>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D <0x02 0x00 0x100000>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0linux,pci-domain =3D <0x01>;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-map =3D <0x00 0x00 0x00 0x01 0x01 0x=
00 0x96 0x01 0x00
> 0x00 0x00 0x02 0x01 0x00 0x97 0x01 0x00 0x00 0x00 0x03 0x01 0x00 0x98
> 0x01 0x00 0x00 0x00 0x04 0x01 0x00 0x99 0x01>;
> =C2=A0 =C2=A0};
>
> At first, according to [1], the #address-cells must be 3 and
> #size-cells must be 2. In Jailhouse, this is taken from the parent
> node. I don't know if that might be an issue.
>
> But it's weird that the reg property is just 3x 32bits. According to
> the Jailhouse code at [2], I would expect it to be 5x 32bits long.
> Doesn't the kernel think that the size is=C2=A00x10000000000000 or
> something similar?

That is correct, reg property is defined by the #address and #size-cells
of the parent node which are 2 and 1 in this case.

But one needs to change the reg and ranges properties in the inmate .dts
as well. At least i think, I forgot the ranges last time I tried.

Christoph

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/07e0e959-4d93-58aa-4720-356d3bd7066e%40uni-tuebingen.de.

--------------71309D5BE73E4AD98ECC9DD9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 8/19/20 1:31 PM, Jakub Lu=C5=BEn=C3=
=BD wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAGdCPwuAGqYaeUik+c1oFX=3DZo3JmDmm1JdyMiYPPVyi4ovGvQg@mail.gmai=
l.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
      <div dir=3D"ltr">
        <div dir=3D"ltr">On Wed, 19 Aug 2020 at 13:03, Christoph Gerum
          &lt;<a href=3D"mailto:christoph.gerum@uni-tuebingen.de"
            moz-do-not-send=3D"true">christoph.gerum@uni-tuebingen.de</a>&g=
t;
          wrote:<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            During our work on autojail we also had the assumption that<br>
            .pci_mmconfig_base needed to be below 2^32, but we could not
            find a<br>
            reason for that in jailhouse. I was think, that this
            restriction was<br>
            either caused by the linux driver or a misconfigured device
            tree. But I<br>
            will revisit the problem in the next days.<br>
          </blockquote>
          <div><br>
            I have been looking into that and the device tree generated
            by Jailhouse might be the issue. When I move
            the=C2=A0.pci_mmconfig_base to 0x200000000, the generated devic=
e
            tree looked like this:<br>
            <br>
            =C2=A0 =C2=A0pci@0 {<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-coherent;<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0#interrupt-cells =3D &lt;0x01&gt;;<b=
r>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-map-mask =3D &lt;0x00 0x00=
 0x00 0x07&gt;;<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges =3D &lt;0x2000000 0x02 0x1000=
00 0x02 0x100000
            0x00 0x4000&gt;;<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "pci-host-ecam-generi=
c";<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D "pci";<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "ok";<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;0x02&gt;;<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-range =3D &lt;0x00 0x00&gt;;<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;0x03&gt;;<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x02 0x00 0x100000&gt;;<=
br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0linux,pci-domain =3D &lt;0x01&gt;;<b=
r>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-map =3D &lt;0x00 0x00 0x00=
 0x01 0x01 0x00
            0x96 0x01 0x00 0x00 0x00 0x02 0x01 0x00 0x97 0x01 0x00 0x00
            0x00 0x03 0x01 0x00 0x98 0x01 0x00 0x00 0x00 0x04 0x01 0x00
            0x99 0x01&gt;;<br>
            =C2=A0 =C2=A0};<br>
            <br>
            At first, according to [1], the #address-cells must be 3 and
            #size-cells must be 2. In Jailhouse, this is taken from the
            parent node. I don't know if that might be an issue.<br>
            <br>
            But it's weird that the reg property is just 3x 32bits.
            According to the Jailhouse code at [2], I would expect it to
            be 5x 32bits long. Doesn't the kernel think that the size
            is=C2=A00x10000000000000 or something similar?</div>
        </div>
      </div>
    </blockquote>
    <p>That is correct, reg property is defined by the #address and
      #size-cells of the parent node which are 2 and 1 in this case. <br>
    </p>
    <p>But one needs to change the reg and ranges properties in the
      inmate .dts as well. At least i think, I forgot the ranges last
      time I tried. <br>
    </p>
    Christoph <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/07e0e959-4d93-58aa-4720-356d3bd7066e%40uni-tuebing=
en.de?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/07e0e959-4d93-58aa-4720-356d3bd7066e%40uni-tuebingen.de<=
/a>.<br />

--------------71309D5BE73E4AD98ECC9DD9--
