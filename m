Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOG44HZQKGQEAWFL25Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 7093718F0A0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Mar 2020 09:07:21 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id a11sf2285678ljn.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Mar 2020 01:07:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584950841; cv=pass;
        d=google.com; s=arc-20160816;
        b=T70j8Ha/QTgzx7+8TFxlJK7d5Kh3VaGvjHkzXPr7BO7D7IzdKUGWH1OqEf5vstFMvP
         H9swAuL03HRh6mLbBMvcewCZOTLWsfFbsvXSYRHmRHMGSfL++kcos+NknYVTY6EW1/Sb
         dmpvALbGW9GyST+ivbuVyxClKBv/i0r4/XBu7CaqemVzx6Za7/ZcnQl/XrpNzyEGBwvW
         bU5PxMwLFUkEcnQrKRHIADFuQ5VVEcu8D5xkKN0NXkTnMyaHewIt9+MbaZrNLHogN72F
         urwLa0OTgp0RikQEpkWMT80ppN81rG58ychuvB4svrQQQUVgUY5t+mh8NHWzIDrgkv28
         JV2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=50vPdUxjybDaUw9yKqIxlYNzs19w9sSgGVTbWDPoYUs=;
        b=QrBHbSBz9MzG31oEmlsK4n/UA63RQAQ/LG7WfdHM8fhBfN7ElW+drQUvDC7nbne9G1
         +e5MCwu+Ox9h3kMZW6LN+QmmaiCbMYhOL7e2EfrkIPv7lciKyRJnCwq7TfyKQ/LUmlVT
         2BgO3y/OGAzpslAl6KI6k2ziioR7QNDDzz1JmPEKojxE6D7rjjVPnRhwd0p6tkp0RCBt
         9Jd/xwvKiW4XsP4tkfZtGOhC/5h7NmmdmpcdO8tlfXC+xgDIsXVjTCKWwtdGIWLSIe9I
         uE1FyVCmf9j/uEPyzCUzVV+ULMQE9i1OybH65z8OTrOVFe7MSDdbKb9s4H6DAVjc1Goq
         //qA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=50vPdUxjybDaUw9yKqIxlYNzs19w9sSgGVTbWDPoYUs=;
        b=UYy/ngJBxkd2WQKf9UMyOJTF5Cu8+1mfkQMZPWOFTi68NYF5W8tK+oDWqDIkMdFuZW
         R9M5wqsFbhMpczKtKewEODhHNFWXBH/SU68ORKVw2hYMmLJ6sIIz/tqRjW3SCVSrs+lj
         K9+ufJgNQFbzY9Gert/yb1GGG9G5spp7OboKmIsrh2w9BmiIT9LDPx+l7/NiAW9l3jaP
         g6utJZvw8/pCZP98dT8n38iorDPaKlvvqE/UOcj14KIr54gePJUvEgG/mss/9usTUa9i
         MmJ6W/Gj0dBJhEuR+uWgP575evgrD4soGR4h1af7ttBv2MLL1+yabw0COIDoPeWB3nl/
         rJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=50vPdUxjybDaUw9yKqIxlYNzs19w9sSgGVTbWDPoYUs=;
        b=feZ4O0yOEknYxemD9oEoJWLkCSi2C+twRVGUtii+D9E5H98qdDwZz+cSSPHXrP6WMz
         8Ygq/SI4KnEgwjVnyF7VTPyGrGtPWs9KOAAZtDGOpgqfHbfvvO0xxRhB82UtdV0qFSBP
         HTay9znl89C4iOh6nACcLzPIjTjhxQQpBu+OT16cE3VkvPD/RSjgCgR8IYWycy+6VxDm
         zS098B1lOcoifMdSca/i/TJuZJs9WY8dHrf74grEDHAPOw5byVzNe8C2JyK57eybpe+J
         ehPc2M91uEzRu0de/PcndHa6s6ABYWpMZMLU13nvXRxi0QQMfmwaZtWW5vhzN8drdeRe
         007g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ285PTwRmyOC2AhJmfEREj+msMpvBxssePQzL4Mr4f1yDsI7B4S
	2+eMv+kWYeiEBfKr9WIJK+k=
X-Google-Smtp-Source: ADFU+vuizTu9P3AENMoFmnT+Q6A4Zx9/I5CJjDJNN7K73CAsexZdwKWfvgJRXcDs/ZfWkRe7yPxYrQ==
X-Received: by 2002:a2e:8350:: with SMTP id l16mr12470548ljh.202.1584950840899;
        Mon, 23 Mar 2020 01:07:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8941:: with SMTP id b1ls2608474ljk.8.gmail; Mon, 23 Mar
 2020 01:07:20 -0700 (PDT)
X-Received: by 2002:a05:651c:1b5:: with SMTP id c21mr13103906ljn.174.1584950840033;
        Mon, 23 Mar 2020 01:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584950840; cv=none;
        d=google.com; s=arc-20160816;
        b=Bnio61h4bgX4zxWaoJEavQ6MsqCxO6CCzp+xTGmYzuIlkwSz3x4wpEMt3jOqQspyyi
         k9f1NT2wRTjlUWIAs+mIC5KkT2gXmVnJhtyDD41l5opuEFsW8YA187RqGKCBTqjm5nwi
         PXfvoW15bo+7FcWOc/c8MuTWr8O4g2GFkkmRwXJxtPXbCSOQYCjQhE6cLx9iZb1iJ/52
         OrAyMaN7e/kGmsQR7qABJQIhw1a/OvW2SpXUNOInZCfZaGYXFfilNqOBLXq4m818K+0k
         yfMbsv9iWxIT4xgpIX6MdsUw/io1OMQY2wWV5nVS+Y0ZFnAUoug9RcW5k5RAziDKmWQ/
         HCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3TE15QIutXGnrDS3wBTv439w1g5+XVf/OCapJ+7DCvM=;
        b=WZEKIo8XM55QOb1TN/man4E9zs6EslYIqE7ZQbVRc6CZVMSwahchMhPY0mEv9UqakW
         Q6tEtjKwjVC5EopRpVUG/yzBcSQFJaFtieaePq6/n/MotDk87W5UJQrP+/Hq5xvfmWTd
         /UjxYZj4enwDmEsyAtb1YRn3EDe794yC3VAVEH50NsHfofHyV2WopUAvYrO6/GBvcVYV
         as6X8dXqn50yAFfdifEor4srpngOYzQRCO4mQlcIxY05dLrGQLV/jWXCazP8z1X1w6Ay
         eTGHAgAnMtdwOYm1imtm0TpFlJjr1XHtqq/5MZW4RX6tzToj12BeJSOVWdcZJWoaPw4Q
         tzdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s17si1050701ljm.5.2020.03.23.01.07.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Mar 2020 01:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 02N87IfF017948
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2020 09:07:19 +0100
Received: from [139.21.64.131] ([139.21.64.131])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02N87HuT026931;
	Mon, 23 Mar 2020 09:07:17 +0100
Subject: Re: GSoC'20 Interested Student: Adding support to Jailhouse
 Hypervisor
To: PRAKHAR BANSAL <prakharbansal0910@gmail.com>,
        jailhouse-dev@googlegroups.com,
        "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com>
Date: Mon, 23 Mar 2020 09:07:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hi Prakhar,

On 23.03.20 07:53, PRAKHAR BANSAL wrote:
> Hello All,
>=20
> My name is Prakhar Bansal and I am a graduate=C2=A0student in Computer=20
> Engineering at Iowa State University, US.
> I have experience with Analysing Performance of Applications running=20
> inside multiple virtual machines hosted by the libvirt QEMU-KVM through=
=20
> virt-manager.
>=20
> I am interested in working on the project to develop a Libvirt driver=20
> for the Jailhouse hypervisor. I looked into the initial attempt on the=20
> Jailhouse driver which seems to be based on the Jailhouse command-line=20
> interface. I am currently looking into learning and understanding the=20
> kernel APIs for jailhouse hypervisor.

Thanks for your interest!

> I followed the below articles mentioned by Valentine Sinitsyn to begin=20
> learning about the Jailhouse hypervisor.
>=20
> https://lwn.net/Articles/578295/
> https://lwn.net/Articles/578852/
>=20
> I have a few questions regarding this project, please let me know if=20
> someone can help me out.

Sure, go ahead. Depending on the scope of the question, libvirt might be=20
the better community to ask. Therefore, I'm adding its list to this thread.

Jan

>=20
> Thanks & Regards,
> Prakhar Bansal
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6557f1be-cce8-21c3-0b76-c78901acecda%40siemens.com.
