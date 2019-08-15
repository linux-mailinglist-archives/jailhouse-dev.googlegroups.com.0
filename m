Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB57523VAKGQE7FJPN4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7588F5AB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Aug 2019 22:22:16 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id k2sf680824lje.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Aug 2019 13:22:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565900536; cv=pass;
        d=google.com; s=arc-20160816;
        b=ckBEMIK7x9nIFQt7GXIZEAXP1R7cgpZhgFbaDUl5jRGdcQM7iskUwKQVAIplUaO0nq
         IIxiMoW+BD9UxytqFzVlwadwit4tsiqTP1aR2nWoQlxae3BH343eg+z5mCDQ39Hnsad9
         bomMqzRfa+n89hRUsMyKqxtPOxk3dp3FVOZdDYEIa3ImUF6q1NDas0JtGQwRXRakc3oL
         3u2gDwBgcdFF+GUiVLDmKw/nAMG9KoP7FYa3JlAFh+52oZHTrU4T5ubtivsVg1FRXckC
         4OG3eT1lNLaHjipbYWCnjWY+pmqiNOUrpWIxzbAawsXJLGOACZddfBhJ8J0B38ZoCkbZ
         b9wQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=Ox2VlQSYvEAehyQC4H6LxCA6LZ4m9AZ6mTEw+KDgj+Q=;
        b=T7ly4+TkVrPsAO1lpK3VKMtQmLavKjM2VJAM60k4aoIlwvS3Pu3I9J1uqT7/JqkWj8
         c42E0k71jiTRTbfrqJikUfZ0qPh1XHcpe1JWCJgd/4ugPSwwyGGR0NYMozwBIMnW/VZF
         5VR/jdjLJY+IZ4oS6nTbMy7laaKxROKmre/0mn7QvdfiZkdCd6BeKXrGRdeu9LCEpNI2
         99vhspVD3foLn+1//oxWiPyVyWXoKPEjaMmzUcdmk/rc/GhayTK1MzOZwOff6a/x8zZA
         GdgoXAWMYzu4PUVn4iKzYBnScOUY1R5TU2EZccHJpARAt9zDUWxcbcIpZwJ+QAPD5oPN
         fuVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=U1zD0foQ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ox2VlQSYvEAehyQC4H6LxCA6LZ4m9AZ6mTEw+KDgj+Q=;
        b=GnDF8CwQT/blCLHLCnFIrqdjtbeWgMA54z0UcbOkadFhU/9hpz1No6dDIkzee3IMbK
         UFWJ5/+LTZYBj6lssawLpkq59na/AyTgwUDO/O+BbCFCghqIv14/9qUx33Xes0LbXrUu
         HQdXaX+sLwfD51SM18QLdxGhHw1R83aM/6n0EdL346P+EpziuRWaVTCl7Z6J+UfKi8ww
         uQOKQrY7lulYKnPTyn+nxVI9ajn6ey5PQuRKcsoWOAZCIu/tq6hKALxazoMmalREQKXJ
         cVGYRn83+2O3QbbBDOZmifHoXGApzGhRjvVVFDjNsheXuW579alQGjj9DDC3xTkfFAu+
         GWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ox2VlQSYvEAehyQC4H6LxCA6LZ4m9AZ6mTEw+KDgj+Q=;
        b=mwcSVqk8N5fVvTihjJgTgkH6UnMYOhxteVNL2nKDkCGTOHVG1qKWNj1lWhK7SrEVed
         lLkc9TGEcEU/DsMuyiHykCN2zy9ZGRSgEWpw8qa09T72Frg48/kvZZSwvQ4OepoK7bDO
         C/GlCP7Kdp3eFvCr5GMK/YVLNcsyvSY7PV2EJOjO8FbfeikULo8aWHFI0TrXa4uaHxwf
         Z8NXMkPNHdHXkFaO+0o3InBoOUgLAuGIr+cgCuS5NbG1Nl0rg2b1Hd3W9xduswkc1r4p
         jhPHfo5QiOtb0PGwEN9NAJp2OSVN3ZOyy2WVgAsPEl8BRiC/IPIGQOrz1GWlmuIn1uw7
         IaIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUOilofpPLudxRatPDpZOSEXL8LOI+rBB0kPsmiM8JSUE3DXnYX
	+xcpk/Jz0wjchjClK27FAvM=
X-Google-Smtp-Source: APXvYqyFFLHYmvmN7HznBPHzWOxCT/hSYaBBm49nBDXKrjJONnjBsE57IFwEPWAWDhcfrwJIkpslSQ==
X-Received: by 2002:a2e:8516:: with SMTP id j22mr3577926lji.122.1565900536141;
        Thu, 15 Aug 2019 13:22:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8614:: with SMTP id a20ls753752lji.4.gmail; Thu, 15 Aug
 2019 13:22:15 -0700 (PDT)
X-Received: by 2002:a2e:9d2:: with SMTP id 201mr3492711ljj.229.1565900535568;
        Thu, 15 Aug 2019 13:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565900535; cv=none;
        d=google.com; s=arc-20160816;
        b=NyMYmBlSiAx7Ym2duA+4m4VZoHYtOQeXJskfhQoF/0aNSoAVD3mfNmyr/4MIresghG
         6MY+HZOggvmw8NZPZESysHHHJn8kaV+ra1gavzlpZhzfSxp+GS4MhyNZN6gNRv9hUb7k
         GYFG95fQWi3mrH2yWI6NNLzl5TMnHO3rlmSAXkx6Ti73NB1uEsEjeR9xptx91059D6he
         uweegg1iRMobj4qGQm/5ghnsbniEWjXReiqJ//pp9rcPU/n22talNzhiq364EIYhzarq
         a7e3ilnaYZqnRCsG5Zq4Ybc0qeLQWyQVUJPG9NXRwpQPqAcatLWkdcJf30JnnDx6s+VH
         9z8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=Vz6sdD8nQpth51Yg5OkASKEPgSrfKQo/X0YW6p1yRA8=;
        b=hdKy3GxLvdRLs2nU67Gynq4ZmqeVG+hTUQ/2DGkr8XnCzufm/rjVmJx4gDH8BouWSs
         oNDcvKsIzerqmJp89dQvdHCQbEYkD3HbUYkRIe+wE1BFes9uEp0WpmLa19nzLor0HIqn
         G7LwO8elUk/9B9zFLvIiWnqBAMQZErJIhzW9q9w7A6HD9IuOSuoXfn79ERYR5FdvgixV
         7DWo05vxcZySud4eIu7NVocDVD/oK5Cg0o7sWyphZDuQm05Iv9kLDROcRpSaf92PLNEv
         0TFyIRTv67PsSc3sn5GGhjX+vLXNI4liTN36qqpBKv3g+b1G9NZo9So4lR7NaJgNnT0M
         Gq6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=U1zD0foQ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id m20si115341lfh.1.2019.08.15.13.22.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 13:22:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 468dCp3Ns6zxvN;
	Thu, 15 Aug 2019 22:22:14 +0200 (CEST)
Received: from [172.16.37.64] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 15 Aug
 2019 22:22:13 +0200
Subject: Re: [PATCH] driver: Account for renaming of lapic_timer_frequency in
 5.3
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
 <274f6f7f-401d-d275-4b53-dd957cd641ba@oth-regensburg.de>
 <5d66e114-6e4e-1b79-ed67-364455c048d5@siemens.com>
 <54d5522f-16cb-0ebf-b93a-821d13da7ce8@oth-regensburg.de>
 <29a363fe-0fb7-debc-56fd-986d88c990a6@siemens.com>
 <484bee87-00a2-9121-6a99-77949b5fbf5d@oth-regensburg.de>
 <d497494a-95aa-82fa-c9b7-29c74e395c78@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFsT8OUBEADEz1dVva7HkfpQUsAH71/4RzV23kannVpJhTOhy9wLEJclj0cGMvvWFyaw
 9lTRxKfmWgDNThCvNziuPgJdaZ3KMlCuF9QOsW/e2ZKvP5N1GoIperljb3+DW3FFGC8mzCDa
 x6rVeY0MtSa9rdKbWKIwtSOPBgPk7Yg+QkF0gMHyDMjKrNPolnCZjypAIj81MQfG0s6hIwMB
 5LXZPl9WL2NwcBWxU71NBhyTvtVMy6eCPTDIT+rDIaIjdqXUbL8QBzaApxSLAgb7Nbatkx7k
 3LjqflPMmtQfQ67O1qS/ILe5DrYjGbwZWYb2xmXNwJvEENIDou9Wnusxphh1P1acnn+9DIjQ
 9/A+/zCiube3tgCpv5sq8++knQChn2NLMrHlVsRCgGApciO7/0hCvcS9mGE1JM3Nmwfs2wqW
 vG9vhv3uBJHjH4C8s5UCvF/44E22+bBqsrLUlr5d+YRNtY+LCH1rwNIrzNtfZraq0hPiI8pv
 P4GpvHDmrsGTyG9YbD33XiI7DD8IaAtwld7wSkMmt07NRhyxVsPc1ZIBQMyS28VvuLbDK4f6
 WyjQMJmA8EQspEmNcTFG6LnmW+7PGad2Nt7RhHRs4e4JkT8WckWzTCRzlRusyr13SbiFWznt
 +29Q47elnVUG3nB2h1VGZofX+myYJS0uX4BQ2G7sO+LrBY4HXQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPhYhBMAttVrc
 MMGXiLwkKnP5TRHIUlLMBQJbE/EnAhsDBQkFo5qABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 AAoJEHP5TRHIUlLMICYQALEBOS5+OegeYvi/8qwcXWTtSPu6/L6z2kgh6XCii8zH8Rn9T1mB
 xzA5h1sBku1wIH+xloRxNNmZlxNyJOML5zMng8cLw/PRTDZ3JdzIFFw7bssAgDiLzr8F0gTq
 bRrAwFCDuZMNCJgJhxRrPRNSrZovqUeaSUAxw10Dea3NgcvJ1SLtClBaU2+U7dHQdBINBLXm
 UAg54P6voe/MhkPEwESRHWKsiEWBp4BBPv8AjXnYAth6F9LZksugF4KZMPWnEgXNjw6ObD6C
 T7qA46/ETXBcxI05lQFs3G9P6YpeOmH1V5pRWb2pS/f9vDudU52QRcAIUir0yjR45tmgJMLV
 oRR7xRyj/BXqBHbzjilg3GDZMiUtfjg6skr++du79b7xnoEgzHR/ByHW67MCbjcuTmpTeXBK
 Iq61He/l2NETfy+2ZnWOUNC7/lZHdfrEyHR3Q3S7TQbkm80TXE05Cfb5NXtZxlbCNxFEMtCT
 UeaUX0NtsHfRDNBzFY6pKSpg8EXDtEFe8+utLekEZ6lFgQ5ZJ1c9NfaOiRJ/NrnQfqAEXUyo
 uILPmXK+3UiFlWtmIIzSQ/Wd+4pJtM291zt0umnxboOZc1mOU9B2wKT3mnA3HxQ1LiRIT9j8
 l8iT6TwRB/aiiXa51hN4R7rfSQMxK6a93EAyUZSoWFpZiBo1/5PynB4zuQINBFsT8OUBEAC9
 HeOKJ/KJ861Q/5C1qwHRK95nJiwCCpASxip68e3ZW9vPTV3VmcQ3tPNRBLPZW1S+IV6DL8/j
 HnopXyyrFBkSJYEAtKkBI5xO6olYglCJqhJ5GdE2WIxvFfTkKwXf3gYc7zuif/5tS7D4XeEH
 wScrncFHCxDSUCXyGM/lnLhu3HfQbK49whpel67uteHrXC4tCMzaTy1SOwlXQi4nufxfARBe
 PT2udi+aZCs4a5bTqvEllPsWRsab4JjTsd831VLYCeRM6siKkzzv9nUjBjTri2cPm0FDS80X
 vQVHEw4bP+V4EvcrarNh/9VmCypuH23qRsAX33mLhB94aBoE6afCkWG5G2m24pj3NCkdA0MG
 IleuuD4/I+6+31Dip53AMvx5EDepMrA2b7gsQOKidgDe1fz/j1qkszmQlxlcb/LruXMWWY7L
 3NcwGUjNRfH0KiSyQ6GMtU5ECu8/o4fecOee76fHTviI6h7jSL3O0AKJadUXekAfhyVS/zUD
 iZTv2zI4wAyxIWj3AFVXXeb1T4UG+k4Ea+M7+jtgGUz/K3/mDYXWWRHkT5CMZLiU8BCdfewg
 Zp94L5KOWDYCeX5LWworOwtkoePd9h5g7L2EBbeINk8Ru018FkEiqALN03vPI8KYNXb6epUg
 xhdvhaPoSD3aCnQttvU8lN70cKBGMwTZYwARAQABiQI8BBgBCAAmFiEEwC21WtwwwZeIvCQq
 c/lNEchSUswFAlsT8OUCGwwFCQWjmoAACgkQc/lNEchSUswevA//RM2YQI1Z3QMBRMr/5As0
 2zXcJFp+j07wkO9avm8U7GwjPjLHGVvs44rTSc0IKSsIKCJDSqNod9jd2iR39lr5/FpRiRk/
 7A1ACZUagASNC+PiyCCjlg34bWulzVmb5ozjqKQqgYww4c6D0P44JDUtedVbKd7HdwjjzP0P
 cubSgAohnXzrkp3gtVg07KeoQyiZctJqJu9Z84MiXMIQ+G75mFkIJEL4WYIkcJ9pamUHX71Y
 T1s6qtrqXemn25w87TioHUMcW4wRXhHHJ4gDbe/P9wb9XKS41ks0kiTia1ZcFsf6QQzoCoK1
 R8ahGzsqvCRHMR7fU5w25qXAPfS5ENZgH0KcAVi1bDjwDyhQk3PfPiraiHmtEz2IlthAPpRD
 Drr0lqCvDFNtqaC+ZI0eOmTvy6/zfVh7ODmaDq1KqMu5EB9ojHXM7N6XXN8OubY+lNx+q0T5
 STssqr8EKkrHp6rw2OQHCX7uaEQri2GEJW4HowVvlashmxC4bxR8B4gbm+EB8gR8PD7BSZQG
 k5NkPOqUZJXq1HO+d5Udk1WdT+mkFGwIMN/U9t3gJNWkab+aAYg1mKwdz7B+10j51vbQbFgY
 2/n9jtl/AFgfYQocbJta5+0fOwIJObNFpLAotvtFNF+Q164Bc3E7Njh230nFduU/9BnmCpOQ
 RncIIYr0LjXAAzY=
Message-ID: <aae3503f-d41e-6d74-76b2-166c1f02a51a@oth-regensburg.de>
Date: Thu, 15 Aug 2019 22:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d497494a-95aa-82fa-c9b7-29c74e395c78@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=U1zD0foQ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

On 8/14/19 5:50 PM, Jan Kiszka wrote:
> On 14.08.19 17:27, Ralf Ramsauer wrote:
>>
>>
>> On 8/14/19 5:18 PM, Jan Kiszka wrote:
>>> On 14.08.19 17:16, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 8/14/19 4:35 PM, Jan Kiszka wrote:
>>>>> On 14.08.19 16:11, Ralf Ramsauer wrote:
>>>>>>
>>>>>> On 7/25/19 8:01 AM, Jan Kiszka wrote:
>>>>>>> "lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =
=C3=A4ndert
>>>>>>> sich
>>>>>>> nix."
>>>>>>
>>>>>> Doch.
>>>>>>
>>>>>> We have a problem if KALLSYMS_ALL=3Dy. Jailhouse will compile, but i=
t
>>>>>> fails loading the driver module with EINVAL, the symbol can not be
>>>>>> resolved, see below.
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>> ---
>>>>>>> =C2=A0=C2=A0=C2=A0 driver/main.c | 9 ++++++---
>>>>>>> =C2=A0=C2=A0=C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/driver/main.c b/driver/main.c
>>>>>>> index fe752753..b3896609 100644
>>>>>>> --- a/driver/main.c
>>>>>>> +++ b/driver/main.c
>>>>>>> @@ -100,7 +100,10 @@ static struct resource *hypervisor_mem_res;
>>>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0 static typeof(ioremap_page_range) *iorema=
p_page_range_sym;
>>>>>>> =C2=A0=C2=A0=C2=A0 #ifdef CONFIG_X86
>>>>>>> -static typeof(lapic_timer_frequency) *lapic_timer_frequency_sym;
>>>>>>> +#if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
>>>>>>> +#define lapic_timer_period=C2=A0=C2=A0=C2=A0 lapic_timer_frequency
>>>>>>> +#endif
>>>>>>> +static typeof(lapic_timer_period) *lapic_timer_period_sym;
>>>>>>> =C2=A0=C2=A0=C2=A0 #endif
>>>>>>> =C2=A0=C2=A0=C2=A0 #ifdef CONFIG_ARM
>>>>>>> =C2=A0=C2=A0=C2=A0 static typeof(__boot_cpu_mode) *__boot_cpu_mode_=
sym;
>>>>>>> @@ -550,7 +553,7 @@ static int jailhouse_cmd_enable(struct
>>>>>>> jailhouse_system __user *arg)
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
config->platform_info.x86.tsc_khz =3D tsc_khz;
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (config->platform_inf=
o.x86.apic_khz =3D=3D 0)
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
config->platform_info.x86.apic_khz =3D
>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 *lapic_timer_frequency_sym / (1000 / HZ);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 *lapic_timer_period_sym / (1000 / HZ);
>>>>>>> =C2=A0=C2=A0=C2=A0 #endif
>>>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D jailhouse=
_cell_prepare_root(&config->root_cell);
>>>>>>> @@ -897,7 +900,7 @@ static int __init jailhouse_init(void)
>>>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_=
SYMBOL(ioremap_page_range);
>>>>>>> =C2=A0=C2=A0=C2=A0 #ifdef CONFIG_X86
>>>>>>> -=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
>>>>>>> +=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
>>>>>> Here, lapic_timer_period won't be replaced with
>>>>>> lapic_timer_frequency in
>>>>>> the RESOLVE_EXTERNAL_SYMBOL macro:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 symbol#=
#_sym =3D (void *)kallsyms_lookup_name(#symbol);=C2=A0=C2=A0 \
>>>>>>
>>>>>
>>>>> Hmm, 2-stage pre-processor would be needed here. #if
>>>>> LINUX_VERSION_CODE
>>>>> sees to be required then, what a pity.
>>>>
>>>> Yep, I have that exact case: 4.19.x + KALLSYMS_ALL.
>>>>
>>>>>
>>>>> Want to write a patch as you have the setup already?
>>>>
>>>> Well, my current setup is to disable KALLSYMS_ALL. :-)
>>>>
>>>> But I don't see how this could be patched, is there a way to tell the
>>>> preprocessor to roll out #symbol before interpreting it as string.
>>>>
>>>> The only way that I see at the moment is something like the attached
>>>> patch (only compile-time tested).
>>>
>>> #if VERSION < 5.3
>>> =C2=A0=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency)=
;
>>> #else
>>> =C2=A0=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
>>> #endif
>>
>> Huh? How should this work?
>>
>> Independent of the kernel version, we have to set
>> lapic_timer_period_sym. The VERSION < 5.3 case will try to set
>> lapic_timer_frequency_sym, which doesn't exist and isn't used.
>=20
> Ah, oh. Would conditionally redefining lapic_timer_period_sym to
> lapic_timer_frequency_sym help us?

Not really, then we run into the 2-stage preprocessor issue again. But
this might do the job (only compile-time tested):

diff --git a/driver/main.c b/driver/main.c
index b3896609..beff73d6 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -102,6 +102,8 @@ static typeof(ioremap_page_range)
 #ifdef CONFIG_X86
 #if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
 #define lapic_timer_period     lapic_timer_frequency
+static typeof(lapic_timer_period) *lapic_timer_frequency_sym
+       __attribute__((alias("lapic_timer_period_sym")));
 #endif
 static typeof(lapic_timer_period) *lapic_timer_period_sym;
 #endif
@@ -900,8 +902,12 @@ static int __init jailhouse_init(void)

        RESOLVE_EXTERNAL_SYMBOL(ioremap_page_range);
 #ifdef CONFIG_X86
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
+       RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
+#else
        RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
-#endif
+#endif /* LINUX_VERSION_CODE */
+#endif /* CONFIG_X86 */
 #ifdef CONFIG_ARM
        RESOLVE_EXTERNAL_SYMBOL(__boot_cpu_mode);
 #endif

  Ralf


>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/aae3503f-d41e-6d74-76b2-166c1f02a51a%40oth-regensburg.de.
