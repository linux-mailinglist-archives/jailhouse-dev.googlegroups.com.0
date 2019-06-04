Return-Path: <jailhouse-dev+bncBAABBC4M3DTQKGQEPVOP4XI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290B33E8B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 07:47:57 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id g30sf9676406qtm.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2019 22:47:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559627275; cv=pass;
        d=google.com; s=arc-20160816;
        b=bjFxU8vcRTqJ9FbK58UTOZt1dF0MnZTusEWkRgRsZ9Ba6JqQ5QSqLlqsIhu66vsQGW
         MWLBLpvOzTIiAshGfT2cJtQvL8jS2WD20Qql54e9iMY0Aec4V5HEcWTWYpq7I8dktRi7
         HkDGf/wqRKQAhTW/iaDBHMfY1XhxC1rdkbCN8SXVXqG8ALEMOE0Pd3pDzWRff1dfuwfo
         pbTMtWl1Vco9dl9+gu2ZofZCJ4UjGXj/YhlyP1fNHStcpfYWr8/TRVaUIJqBNHoyvktG
         WDoxDEwDtpqxbR/95sdFqvb3UPJJD3KzlF/8+pZSLM9GpKjDm6raZacMeisyDvV+uCor
         0kdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:acceptlanguage:content-language
         :accept-language:in-reply-to:references:message-id:thread-index
         :thread-topic:subject:date:cc:to:from:sender:dkim-signature;
        bh=5BqabVye1nbutvhIbGjNoE5zvvlddDddJhDOdOooX94=;
        b=doaz10zn8n3NCXSpFT7u3x0sNMR0/TwGV5Xm1ZdSWrCJcyMffsQ6OoW6dPoJuafF1n
         4DwStyJ5o6el0MK16gxW1IzDrst1zyld6Ki1sgn0vXuzrQUtvgRtQsO/AG3lH+NFCYps
         rFq/NVNj9YeqCM0X0BV0Vmi0gZRNWYV2t1uub5NmnTfwufqlTw1w7rcywgE0ZZesv45v
         iqtHM/zC3NmZ42tN62DAGTkKlox11Hn9/wapXvMDUzJHVIPKCi3ipV51Qs7Khi71833a
         1T/hoQWHQcfKpIKqP6lpp/LyXScJA3lQVNZdKxp79NdxYztoBFShJfWqTCIeO+8q2SCL
         /yIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as permitted sender) smtp.mailfrom=lei.xiong@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:date:subject:thread-topic:thread-index:message-id
         :references:in-reply-to:accept-language:content-language
         :acceptlanguage:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5BqabVye1nbutvhIbGjNoE5zvvlddDddJhDOdOooX94=;
        b=Qi/C4r3ZZppT3WdXFFVcjqXikaht5jnuqm8DEAz9eHp3wM+/X/oH7zJPK9oKEF8twn
         AVYEjfQLyI88rtdBcU5YCHBCzNuutcApei7ubWK9QuFk+rxW2bEZ3bMyUr64FJuzOIIR
         +8x1TQCopPJ7PwuIs7eKeiJSOHZEhZyReqvzoHQtNJ2pDHnGzAOMefEpjr1tkZKv1dxl
         hM6alBX+q8YF/hY8Vzket4yMWmiXcsEfSVNoa88WKPZFTszFAHGRj9dUeJK1V2uFZXJK
         xpMB8OreKuMyCuRyA5k6tsUwCSe0zR7uFOinp7Ruow4mNcVbrnuKZ6ggnN0fcB20tkbD
         U7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:date:subject:thread-topic
         :thread-index:message-id:references:in-reply-to:accept-language
         :content-language:acceptlanguage:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5BqabVye1nbutvhIbGjNoE5zvvlddDddJhDOdOooX94=;
        b=kq5Qgj6D9QUO4pIRFDgdVN7KN//aBRTLNwknHdRsoyIOgxeO0yuQ6NpSLJZ3q/E0DE
         KbEXvJFHxqfLltYNntUeRxs5/gfLVo5H8cwoclHbSuI/LEdCj3CjEpy6dvOB7o7HLSuY
         xVBHPDmUbp1fS6fboLpVBuNdbM9vW6+sgcZVAV8gYWCX7K3vzZZJ6OQT2wsNl5A02/J5
         7juLhylq+/YJrKKwNbQTmUPP4YpP75tDccdn8oOGP/Ftb9ZPJZpRMX5BAi8UIw/9kvi8
         v+pBwJj1QxPVcbutBXB2pZa1o8IiGPNFBtm9VNbko/MmnW/iSaxX+Ivc4jiWDF8AA4eV
         //eA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXuZaMU8sCs9zIcGVBXQTBss60e/wiaGl5QQCs9P6Wbgt0B+NhL
	rGxas1M8HBRF+mGAbmPNxfE=
X-Google-Smtp-Source: APXvYqxGkIkRVskj1B4CceVCey/Eio3Mos7iFg/Wx49g2Bw2TzdxQKSfwjcBAyzsg5yp3T7NwGyUTg==
X-Received: by 2002:ac8:2b24:: with SMTP id 33mr27683822qtu.166.1559627275724;
        Mon, 03 Jun 2019 22:47:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:11a7:: with SMTP id u7ls1716603qvv.16.gmail; Mon,
 03 Jun 2019 22:47:55 -0700 (PDT)
X-Received: by 2002:a0c:c164:: with SMTP id i33mr6613833qvh.37.1559627275480;
        Mon, 03 Jun 2019 22:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559627275; cv=none;
        d=google.com; s=arc-20160816;
        b=jmAW0/YjWgib+AeXfzb34heJdt7Yhvw2d8vmWu3Z32aQQ/yT5ge+kY1nMggQr0vn1N
         yu1zI+tEQcT4ZjqgKbMnKJhlxD3rnCE3s7PDNAoEQptahEXNRkLEqldzX31i6pwJA36N
         rMV7owthHkYDpQMbF6YsdK6sKR+69JbDTIEOQcRufA0sT9g9lBsSJ7xhXvYESFWIhICJ
         xKvBBSGOlD74IQZlE7DUq0i0yJF8pC/M/K3RqHinSQ92rxse9DMicwZNrloIQ4ej2IZQ
         cPThnPKKHxy7V/3+nzipNNNLwWagnxHNXzHbkmQgL97G7hK3oOTim+5AySzjc08syVdi
         DJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:acceptlanguage
         :content-language:accept-language:in-reply-to:references:message-id
         :thread-index:thread-topic:subject:date:cc:to:from;
        bh=OW2OBOY5aNmtyGlpg8n23cXt8dEJ5lIrco5YOc7CVD8=;
        b=moRKGqolciFxF044zylYXrvioVLX34T2cuu2gStok37bf/uZlg0a+DQpxmoT5WEAA7
         CFxUq2tlu+Vccf3qQJHOmRgP+VXyqHnVywFIEunZ5AuS25y5DCvw5hn7kgo+fhLwICB+
         XSsquH4uBNmEY7XFFVCMKiEhbfJd/11UOI4fPBT9+iRrjVu/8dIucHszC0XNZ0Bf5ehV
         SzcZAwicj59DDvTvRk6XQb8kyEQ3+fSX4FWM0pVEDU3rACWPs/WJMW4+6Cdrt+YKU/JX
         D2h2R8Ff3qMOkjwRs2akqs2ZV+uGU6aDXa+wXMafLr+snl1y3mx4FY+unUJDqMYtkQTl
         Pyfw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as permitted sender) smtp.mailfrom=lei.xiong@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.com.cn (david.siemens.com.cn. [194.138.202.53])
        by gmr-mx.google.com with ESMTPS id y53si236403qtj.1.2019.06.03.22.47.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 22:47:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as permitted sender) client-ip=194.138.202.53;
Received: from mail.siemens.com.cn (mail.siemens.com.cn [194.138.237.52])
	by david.siemens.com.cn (8.14.9/8.14.9) with ESMTP id x545lpjm031212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 4 Jun 2019 13:47:51 +0800
Received: from CNPEK01905.cn001.siemens.net (cnpek01905.cn001.siemens.net [139.24.236.71])
	by mail.siemens.com.cn (8.14.9/8.14.9) with ESMTP id x545ljHb024893
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 4 Jun 2019 13:47:51 +0800
Received: from CNPEK01937.cn001.siemens.net ([169.254.1.207]) by
 CNPEK01905.cn001.siemens.net ([139.24.236.71]) with mapi; Tue, 4 Jun 2019
 13:47:16 +0800
From: "Xiong, Lei" <lei.xiong@siemens.com>
To: "Kiszka, Jan" <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Date: Tue, 4 Jun 2019 13:47:46 +0800
Subject: RE: How to disable CONFIG_VIDEO in the U-Boot config
Thread-Topic: How to disable CONFIG_VIDEO in the U-Boot config
Thread-Index: AdUalEsjgZQ/EZMpRY+KErJe6ccelgAA4j/w
Message-ID: <C6C9DF0CAE5FD841919323C24BDCCA91D3A33501A6@CNPEK01937.cn001.siemens.net>
References: <C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1@CNPEK01937.cn001.siemens.net>
 <9b0508b3-d040-4093-2b69-e3db932b0b51@siemens.com>
 <9ddd1411-e67a-f87e-58ff-280fbec53fe6@siemens.com>
In-Reply-To: <9ddd1411-e67a-f87e-58ff-280fbec53fe6@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
acceptlanguage: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: lei.xiong@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as
 permitted sender) smtp.mailfrom=lei.xiong@siemens.com;       dmarc=pass
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

Dear Jan

In fact, my hardware platform is banana PI M1+, I do not find "Banana Pi M1=
+" in the " images.list ".
Is there a jailhouse-images supported for "Banana Pi M1+"?


Thanks you very much~

-----Original Message-----
From: Jan Kiszka [mailto:jan.kiszka@siemens.com]=20
Sent: Tuesday, June 4, 2019 1:14 PM
To: Xiong, Lei (CT RDA FOA ART-CN1)
Subject: Re: How to disable CONFIG_VIDEO in the U-Boot config

On 04.06.19 07:10, Jan Kiszka wrote:
> Hi Lei Xiong,
>=20
> On 04.06.19 02:46, Xiong, Lei wrote:
>> Dear colleagues,
>>
>> In the =E2=80=9CSetup on Banana Pi ARM board=E2=80=9D part, it mentioned=
 that =E2=80=9C*since=20
>> v2015.10, you need to disable CONFIG_VIDEO in the U-Boot config*, or U-B=
oot=20
>> will configure the framebuffer at the end of the physical RAM where Jail=
house=20
>> is located.=E2=80=9D
>>
>> My question is that how to disable CONFIG_VIDEO in the U-Boot config?**
>>
>=20
> Via "make menuconfig" during the manual u-boot build - which the descript=
ion is=20
> not covering in details. If you do not want to fiddle with that, I can wa=
rmly=20
> recommend jailhouse-images [1] and a board that is supported by it out of=
 the box.
>=20
> Jan
>=20
> [1] https://github.com/siemens/jailhouse-images
>=20

...and we can also discuss directly if you have further questions.

That said, generic discussions via the mailing list are always very much=20
appreciated as they strengthen the community. Thanks for taking that route!

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/C6C9DF0CAE5FD841919323C24BDCCA91D3A33501A6%40CNPEK01937.cn001=
.siemens.net.
For more options, visit https://groups.google.com/d/optout.
