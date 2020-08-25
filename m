Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB257ST5AKGQE3JURZ5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33C251AC9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:27:56 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id g5sf3819370ljn.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:27:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598365676; cv=pass;
        d=google.com; s=arc-20160816;
        b=fqam+nteKsHguZiesQGh4l9mh4r8+9DdQwiPKYLoTb5vHLQ3Tx7HnXV/GTfhYy/oJ7
         mHomn0gTXSYqzYvKMvwzDoAytzOs/E5OAiLp5o8fRBodJSYhOCpauH6I3DiFZv9KC/Sc
         7LH/LhZl/zEEh+DvQgOeL6xiyVf3U4KeaeAnhBqHIZ7WJsampKwcecFRRSPHW9vzmTSk
         cXA+hfHfN9fD/jsNbD+YFjy+JYwxZkEzSjgu5n66LjVPavgX/k9GTBUPPGTjMvg6tQG1
         Kc7B9OsWAzWNlCbNISgx4m9DiV7rqtqw9STloOKO0v1+jP6EJArFQzgGL5fxEURUHE9i
         4kRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Apqr451eWLww1yDl4+OHtvGeLTv1P/RT4IWbuEk9Z3w=;
        b=v5o72UZf2N92OgcHdgv7UgCmJZDqc5wRS2Z3TGptlbyWVk72F9Mcfud5335EvQLipe
         qk0Xj3s2e86elmXGtDd9Ax9y69CSTgAvcB2YFv42sFa7ZxJt/uEeUT/z17XNT/KNQIEB
         IAbfMzJHEBQhKWF/flL0wfHIq4sgUWj+LZNK/kEzr1F1XEER1kMgKEnnXH2ZRQz/DlKy
         NrBaf+UanKgEigTLBdmTZL+3dThxrk3xxnRWq+Dt06sU5rPjNEVPmVhVfp8eU64CP3cx
         lxHeRVnEeJJgr85w74Is9txzJLUQmWngE1sBzs6lMQfDDOD6g6BgvIgUYUuQOmyUCP+V
         RmfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=b6l9Uqxv;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Apqr451eWLww1yDl4+OHtvGeLTv1P/RT4IWbuEk9Z3w=;
        b=swufjm2rJfss41SygvxBYNg/cB8Wdy+qJwsWpUEDoUfqsOSS2l909xWwuO1lF9d7Ia
         WuPvbhE6PSPs1fplyq4S4+S3BZD3WNOBSd8OwHVIyy0yjmceRyJWq9HeuuurPCdIlKsa
         6lF+EXFxL2UvDpxynYD28ovHbPgK12ON+Dx4jvbRkgb1LOj7ZhQ2HNgst6H7E8GzKwSH
         wxf/sQ5emGr59iFBjoyreWngyhWk27h5uru9B3sDdPFyHlmvc8/6Qft1ZJ+PsRdeZpMC
         Bc7GNFqndebmWQx3pEDT6kMJrxDb64UuXC3BhoeiyJgml8TT9+te9aMhUe/r6wmjbmAJ
         mwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Apqr451eWLww1yDl4+OHtvGeLTv1P/RT4IWbuEk9Z3w=;
        b=ozU8Brw+geQF7cFunyjpiJopGt3YnCyqSsiJ3EFbOJl9tuBE5qEmQQrv2sHYxf5NEr
         Lmuj2bs+0dbmSmmiGMRaTny9DUpPjx41oG7CytYOZ04Ikp/j6hjscf/TT+AGOKONb4Iv
         Zl0W3K3qqapWVxS9v5DeQhF7lXnQjDiRbqZ22rvE0nUQYwEyEtA3ML3TGKYoEUSfRanc
         +LxbVAqSaif/RfiEThmwe5wh7tpxnIY+f3QQDVJbbsALM+J3a3491N/NRnmHZUC8XS+B
         jo6bl8wjMqQS9YsBXveXLKba0fjaFpN8XdJhC4u8iob4QA3rabamm8VaBlqFLcwA+k+7
         P3DA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532591F2nj+/GhF3p6xL/AYjRAfoTAAjJZ+0xKOo+GDJeHcQOOhM
	1ClxDYbzJylPHr9NzSPj5Z4=
X-Google-Smtp-Source: ABdhPJzMGZal8NUa/QOTFcCqN0etH/vusnRstPTJ9wR1C1zku3FwjN7QBv05NFIURA5X0PHzFRTT5w==
X-Received: by 2002:a2e:164f:: with SMTP id 15mr5198862ljw.68.1598365676283;
        Tue, 25 Aug 2020 07:27:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1139:: with SMTP id e25ls233291ljo.1.gmail; Tue, 25
 Aug 2020 07:27:55 -0700 (PDT)
X-Received: by 2002:a2e:86d5:: with SMTP id n21mr4783520ljj.188.1598365675329;
        Tue, 25 Aug 2020 07:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598365675; cv=none;
        d=google.com; s=arc-20160816;
        b=sAaopBcBfEKdfVVHYyQsTBv7bnuOFMZ9jG+lm/+1FrqLCHd949i0/IxBFohPXRTaE0
         hVcgtEqZL0B2G4eZquTQ3TDSJ/JYk7RTg3c8c5x8GFpMS6l6R23wor1uQhseilar/D2r
         rgkCiWM4dgywVEETtFDz1crhhNpL91Zw1ycOYsWNL0gMrLO08qDdwaHiQeeqMhSLbKjA
         g5wcPjxLoUoqwS0YZId2JR8cj5MloFGf+oSiVfTBOwQeFrJ6uJIJjInHiyUdip3XTyIm
         upOuajr29L9o6vkjrnU3SKTPw8XZ/K6ZhaMhFzKC/19SCNWk3xwuLWEsHFBWzexncp1l
         82aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=PI4ONA9gfW0XAIJh+zaN04RSDYk1LsdTogTuWefv63I=;
        b=Q5pPEEZI6HJqFSnfn+JYWQGyyl46y/rFwFVWzYcsz6ArTddrFV3ySDdKYRvfB4hEOi
         kqYFA3zutR5YDI/2KhCqsI7g8Tp8GaQmVFlJhGpRNITPQuVq/iRt4kLigidN1+QOTesc
         By/Dcu2L6bwgJZY7G9QOog0ZWQ+RvaYpKXpLZcjSAjCQyNyoPGj7Zo/yTYDr11XRLSHF
         RgPcuMhUXbrgUzVj82p6nh91IdSHdidwKMCBuRkRUdtEEuX9qVcA8k9SvczV3OvCufH3
         ME4NPabn+1zCz+H6f9rP1iLy2PyXB0r0SuSuFrAPYHtqrl+4npgDOPUj1nEh+seCSk2H
         Reaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=b6l9Uqxv;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id u9si588819ljg.8.2020.08.25.07.27.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4BbWYP1mr8zxvK;
	Tue, 25 Aug 2020 16:27:53 +0200 (CEST)
Received: from [IPv6:2003:e9:af14:8c00:e9d:92ff:fe75:492b]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:27:52 +0200
Subject: Re: [PATCH-set] pyjailhouse: config_parser - jailhouse cell linux
 throws an error
To: Jan Kiszka <jan.kiszka@siemens.com>, "contact....@gmail.com"
	<contact.thorsten@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
 <20200715212119.48052-8-andrej.utz@st.oth-regensburg.de>
 <0da1d517-ea14-07c7-05ff-9d529108ef87@web.de>
 <78f3909c-206d-46ba-813b-5dbe5872e7c2n@googlegroups.com>
 <335079f2-a73e-fad0-a446-4dc9d13f00d4@siemens.com>
 <bddbb89a-01c3-4d34-9821-405ec8dcffe5n@googlegroups.com>
 <27eba022-2f1e-6ad6-7448-c56d66cfee4e@siemens.com>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <e3d8f4e7-54aa-0c4f-0f71-ec688b4269e7@st.oth-regensburg.de>
Date: Tue, 25 Aug 2020 16:27:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <27eba022-2f1e-6ad6-7448-c56d66cfee4e@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=b6l9Uqxv;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Hi all,

On 25/08/2020 16:17, Jan Kiszka wrote:
> Hi Thorsten,
>=20
> please maintain CC lists on reply (AKA reply-to-all).
>=20
> On 25.08.20 14:48, contact....@gmail.com wrote:
>> nope,
>> changed to:
>>
>> Traceback (most recent call last):
>>  =C2=A0 File "tools/jailhouse-cell-linux", line 723, in <module>
>>  =C2=A0=C2=A0=C2=A0 config =3D config_parser.CellConfig.parse(args.confi=
g.read())
>>  =C2=A0 File "tools/../pyjailhouse/config_parser.py", line 214, in parse
>>  =C2=A0=C2=A0=C2=A0 self =3D cls.parse_class(cls, stream)
>>  =C2=A0 File "tools/../pyjailhouse/config_parser.py", line 50, in parse_=
class
>>  =C2=A0=C2=A0=C2=A0 data_tuple =3D fmt.unpack_from(stream.read(fmt.size)=
)
>> AttributeError: 'bytes' object has no attribute 'read'
>>
>=20
> OK, I was only fixing one patch, but the series goes on, and at least
> two others ignored jailhouse-cell-linux.

Somehow I missed to refactor this tool. Sorry about that.

> Andrej, I'm dropping your series from next again. Please fix and resend.

Ack. Will send a v3 soon'ish.

Thanks,
Andrej Utz

>=20
> Thanks,
> Jan
>=20
>>
>> j.kiszka...@gmail.com schrieb am Dienstag, 25. August 2020 um 12:20:10
>> UTC+2:
>>
>>      On 25.08.20 10:37, contact....@gmail.com wrote:
>>      > At the current head of the next branch, jailhouse cell linux
>>      throws=C2=A0 an
>>      > error:
>>      >
>>      > Traceback (most recent call last):
>>      > =C2=A0 File "tools/jailhouse-cell-linux", line 723, in <module>
>>      > =C2=A0=C2=A0=C2=A0 config =3D config_parser.CellConfig(args.confi=
g.read())
>>      > TypeError: __init__() takes 1 positional argument but 2 were give=
n
>>      >
>>      > Thorsten
>>      >
>>      > PS sorry for probably replying to the wrong patch-thread
>>      >
>>
>>      No problem - thanks for reporting!
>>
>>      This comes from "pyjailhouse: config_parser: move parsing into clas=
s
>>      methods". Does this help?
>>
>>      diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linu=
x
>>      index 4178d4e0..aab82a5e 100755
>>      --- a/tools/jailhouse-cell-linux
>>      +++ b/tools/jailhouse-cell-linux
>>      @@ -720,7 +720,7 @@ except IOError as e:
>>      arch =3D resolve_arch(args.arch)
>>
>>      try:
>>      - config =3D config_parser.CellConfig(args.config.read())
>>      + config =3D config_parser.CellConfig.parse(args.config.read())
>>      except RuntimeError as e:
>>      print(str(e) + ": " + args.config.name <http://args.config.name>,
>>      file=3Dsys.stderr)
>>      exit(1)
>>
>>      Then I will fold it into Andrej's commit.
>>
>>      Jan
>>
>>      --
>>      Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>      Corporate Competence Center Embedded Linux
>>
>> --=20
>> You received this message because you are subscribed to the Google
>> Groups "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send
>> an email to jailhouse-dev+unsubscribe@googlegroups.com
>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
>> To view this discussion on the web visit
>> https://groups.google.com/d/msgid/jailhouse-dev/bddbb89a-01c3-4d34-9821-=
405ec8dcffe5n%40googlegroups.com
>> <https://groups.google.com/d/msgid/jailhouse-dev/bddbb89a-01c3-4d34-9821=
-405ec8dcffe5n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e3d8f4e7-54aa-0c4f-0f71-ec688b4269e7%40st.oth-regensburg.de.
