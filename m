Return-Path: <jailhouse-dev+bncBCIZLH6PVMJRBFV4WKZQMGQEDKZY3II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 32612909312
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2024 21:46:33 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id 3f1490d57ef6-dfec7058deesf4793084276.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2024 12:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1718394392; x=1718999192; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WY+NQNwrWv7cGpJ6GNmwssVuI4xKABjPyVM+riKXiqM=;
        b=PJDkSQBEqO49bg66hiDCsFhuajXAlAiSvbIHJ01POj1GDhBDOLSxc1CGzi5WV3BXxI
         R8LWyAYGMi2K0rQHXYmWs3qrgFaysHG6vwfOyqxhTvrHNarIFAlgStNGOcjIx3wdQ9Px
         aB89wvfgZANAbNmXdOAmyvSQpJLsuKYogXmiAkuKTS5k0PNyPC4c2cJzEHEte+oOwnbS
         ZkQjJjgRx8/DcVVD6YUjiUHbzMLGT30yYusGKGvpIoebDh+lsmKxpg4GIlHLalUc0//w
         08DQtt1ndjN842qfyAp8xNMTqOrHFN3LK8IsImlfNHGHmoAq8Yi6uLgMtan8IAyKAAY4
         qtFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718394392; x=1718999192; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WY+NQNwrWv7cGpJ6GNmwssVuI4xKABjPyVM+riKXiqM=;
        b=Rf6/OZcgBYEPy7Vm/DzH4NlRHStOrrwmwvfpCOGFFec9dafgSXxn7nhP/rmC+pW9Qj
         S080X1n2wI2ZhQSNYfDEVF9kmqtkj1WGi0P5IEeyuxR7QDxOvTC23QM6afoIme4SkuSA
         POjwSMjABf0jkvth677ANNfNNe8wrOeBu1sqPvZUl4+uSaEhBNGTr8yLquLE7VaG5F88
         mWvOoOVXwJxkLzCZDiXhh3hFFXliLiSLR4KiC3AHDJE4GvSa7HopH5P+lLf/qlqqZhDS
         O0a4fmMZGy20cllTL1YT8FSq2CqsrB/LqNpe9I426o8+cHUlgPHRR+jm/g9NwiN0NjdI
         pcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718394392; x=1718999192;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WY+NQNwrWv7cGpJ6GNmwssVuI4xKABjPyVM+riKXiqM=;
        b=kM+0s+XnsLWmfIDxZCGywLvI/zKSuaY/2JkqxgWFI3ChNF7aL6L6lqFxePTAe8+zWK
         zmMEEXqLlaEOBiZvnns2woX41paKNStfIf1frVmMbkNz/s9Ed+T3Or9JQxqLuhhc3ZtD
         +WQLHatCstmhIawxCpIF6DzKluIAGb8AhEgYCMflhDWMu5aKnxngVknjEs9ptwvQTdak
         ihH4TZI+W/n5fDHhPxSOHAK58xsI3Y1KHotv+tH857Vf8QUZ0K94ZAbC0AHtWVpcHXfe
         euAfGIg93b+3kv3HInf7zJEg9n0bdcM2mnkPpTV+6a7mNX9/VW7JHMQ9wRBhnZDlM32a
         JbgQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXJRuS1qENx0me5DfGfYFLpLc+p79xmb0I8+MEa4vG1JTGBCe2zeDWWFTI6+Rhq3TeHxv77CMkxBYQXJPbDPL5N0oNe+JCQcVMzgFw=
X-Gm-Message-State: AOJu0YwaMuImmIs8XT0711wBh3TdEaRE6yV5PKy7eGOrFb1/sfpVKxXO
	DUF6jGTR7TIlIUKNDD/9Mrc+sH1eNtZ5Ijn4ekojneeeaNC1AmMf
X-Google-Smtp-Source: AGHT+IErHJXz+EMYne8J5xvKxeRhKArC47CWKQEm4K5tPfKthr5/tOpzmDHvfjh7E8aQJ8A/zip0xA==
X-Received: by 2002:a25:186:0:b0:dfa:599e:8b74 with SMTP id 3f1490d57ef6-dff15345993mr3495249276.10.1718394391823;
        Fri, 14 Jun 2024 12:46:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1022:b0:dfe:d0d8:ea2d with SMTP id
 3f1490d57ef6-dfefe73785fls2392365276.0.-pod-prod-00-us; Fri, 14 Jun 2024
 12:46:30 -0700 (PDT)
X-Received: by 2002:a05:6902:18ca:b0:dfe:fca5:2b9c with SMTP id 3f1490d57ef6-dff1389defemr1081640276.2.1718394389880;
        Fri, 14 Jun 2024 12:46:29 -0700 (PDT)
Date: Fri, 14 Jun 2024 12:46:28 -0700 (PDT)
From: karly banks <karlybnks@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c8c17894-b200-4b14-b32b-97bb316645c7n@googlegroups.com>
In-Reply-To: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
References: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
Subject: Re: jailhouse + ZCU102 V1.0 + second UART problem + petalinux
 2017.4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_27596_1174173678.1718394388763"
X-Original-Sender: karlybnks@gmail.com
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

------=_Part_27596_1174173678.1718394388763
Content-Type: multipart/alternative; 
	boundary="----=_Part_27597_519015632.1718394388763"

------=_Part_27597_519015632.1718394388763
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looking for where to buy high quality pain and anxiety pills, depression=20
medications and research chemicals for research purposes? Be 99.99% sure of=
=20
product quality and authenticity. With a focus on quality and customer=20
satisfaction, we ensure that all our products are sourced from reputable=20
manufacturers and undergo rigorous testing for purity and potency.


WHERE CAN YOU BUY DMT POWDER=20
HOW TO BUY DMT POWDER ONLINE
 DMT POWDER FOR SALE ONLINE

https://t.me/ukverifiedv
https://t.me/ukverifiedv

K2 PAPER FOR SALE ONLINE
K2 SPRAY FOR SALE ONLINE
K2 SPICE PAPER FOR SALE ONLINE

K2 PAPER FOR SALE ONLINE BUY K2 PAPER ONLINE
BUY K2 PAPER ONLINE
BUY K2 PAPER ONLINE


 BUY ECSTASY PILLS, BUY MOLLY ONLINE
WHERE CAN I BUY ECSTASY PILLS? BUY MOLLY ONLINE
BUY ECSTASY PILLS,  MOLLY  FOR SALE
300mg -XTC Ecstasy for sale online

https://t.me/ukverifiedv
https://t.me/ukverifiedv
https://t.me/ukverifiedv

 BUY MDMA CRYSTALS, MDMA ONLINE
WHERE TO BUY MDMA CRYSTALS, MDMA ONLINE
MDMA CRYSTALS, MDMA FOR SALE ONLINE

https://t.me/ukverifiedv
https://t.me/ukverifiedv
https://t.me/ukverifiedv

BUY QUALITY POWDER COCAINE (ORDER COKAS) ONLINE
Where to buy high quality cocaine powder?
 COCAINE POWDER FOR SALE
CRYSTAL METH FOR SALE

https://t.me/ukverifiedv
https://t.me/ukverifiedv
https://t.me/ukverifiedv

BUY KETAMINE ONLINE
WHERE CAN YOU BUY KETAMINE ONLINE?
HOW TO BUY KETAMINE ONLINE
BUY KETAMINE FOR EXPERIMENT ONLINE

https://t.me/ukverifiedv
https://t.me/ukverifiedv
https://t.me/ukverifiedv

Buy Adderall online without a prescription
Xanax for sale
BUY HERION ONLINE https://t.me/ukverifiedv
Buy Adderall pills online

https://t.me/ukverifiedv
https://t.me/ukverifiedv
https://t.me/ukverifiedv

Buy ecstasy online
Learn about how to buy dmt online
Learn about where to buy dmt online
DMT for sale online
Where can i buy ecstasy pills
Learn more about how to buy ecstasy=20
Learn about where to buy ecstasy=20

https://t.me/ukverifiedv/2355
https://t.me/ukverifiedv/2347
https://t.me/ukverifiedv/2341?single
https://t.me/ukverifiedv/2338?single
https://t.me/ukverifiedv/2325
https://t.me/ukverifiedv/2324
https://t.me/ukverifiedv/2315
https://t.me/ukverifiedv/2313
https://t.me/ukverifiedv/2312
https://t.me/ukverifiedv/2311
https://t.me/ukverifiedv/2306
https://t.me/ukverifiedv/2304
https://t.me/ukverifiedv/2294
https://t.me/ukverifiedv/2293
https://t.me/ukverifiedv/2291
https://t.me/ukverifiedv/2290
https://t.me/ukverifiedv/2284
https://t.me/ukverifiedv/2279?single
https://t.me/ukverifiedv/2277
https://t.me/ukverifiedv/2268
https://t.me/ukverifiedv/2241?single
https://t.me/ukverifiedv/2239
https://t.me/ukverifiedv/2238
https://t.me/ukverifiedv/2237
https://t.me/ukverifiedv/2218
https://t.me/ukverifiedv/2179?single
https://t.me/ukverifiedv/2175?single
https://t.me/ukverifiedv/2159?single
https://t.me/ukverifiedv/2150
https://t.me/ukverifiedv/2105?single
https://t.me/ukverifiedv/2094
https://t.me/ukverifiedv/2073
https://t.me/ukverifiedv/2264
https://t.me/ukverifiedv/2245
https://t.me/ukverifiedv/2264
https://t.me/ukverifiedv/2246

> =E2=9C=94Fast Shipping=20
> =E2=9C=94Secure Payment Options=20
> =E2=9C=94100% Satisfaction Guaranteed=20
> =E2=9C=943 Days Refund Policy=20
> =E2=9C=94100% Money-Back if any issue with the product=20
> =E2=9C=94Shipping Service: Express/Standard/Economy=20
> =E2=9C=94Estimated Delivery Time: Express & 3-5 Days=20
> =E2=9C=94Discounts: Get up to 20% off=20





On Wednesday, June 27, 2018 at 9:33:04=E2=80=AFAM UTC-7 christophe...@gmail=
.com=20
wrote:

> hi all,
>
> i'm trying to make jailhouse work on my ZCU102 v1.0 (production)
> using petalinux 2017.4 following this documentation :=20
>
>
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-z=
ynqmp-zcu102.md
>
>
> the second uart doesn't work. After a question on the Xilinx forum
>
>
> https://forums.xilinx.com/t5/Embedded-Linux/ZCU102-V1-0-petalinux-2017-4-=
ttyPS1-uart-doesn-t-work/m-p/867113/highlight/false#M26987
>
> i can activate /dev/ttyPS1 on the zcu102 and verify it using=20
>
> echo hello > /dev/ttyPS1
>
> but i still can't use it with jailhouse.
>
>
> i have checked with the gic-demo and linux-demo without any success.
> i can use the debug console with gic-demo, but that's all.
>
> this command should work, but it doesn't :=20
>
> jailhouse cell linux zynqmp-zcu102-linux-demo.cell Image -d=20
> inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c "console=3DttyPS1,115200"
>
>
> in the zynqmp-zcu102-linux-demo.c file, the uart address is correct :=20
>
> .mem_regions =3D {
> /* UART */ {
> .phys_start =3D 0xff010000,
> .virt_start =3D 0xff010000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> },
>
> what can i do ?
>
> regards
> C.Alexandre
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c8c17894-b200-4b14-b32b-97bb316645c7n%40googlegroups.com.

------=_Part_27597_519015632.1718394388763
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looking for where to buy high quality pain and anxiety pills, depression me=
dications and research chemicals for research purposes? Be 99.99% sure of p=
roduct quality and authenticity. With a focus on quality and customer satis=
faction, we ensure that all our products are sourced from reputable manufac=
turers and undergo rigorous testing for purity and potency.<br /><br /><br =
/>WHERE CAN YOU BUY DMT POWDER <br />HOW TO BUY DMT POWDER ONLINE<br />=C2=
=A0DMT POWDER FOR SALE ONLINE<br /><br />https://t.me/ukverifiedv<br />http=
s://t.me/ukverifiedv<br /><br />K2 PAPER FOR SALE ONLINE<br />K2 SPRAY FOR =
SALE ONLINE<br />K2 SPICE PAPER FOR SALE ONLINE<br /><br />K2 PAPER FOR SAL=
E ONLINE BUY K2 PAPER ONLINE<br />BUY K2 PAPER ONLINE<br />BUY K2 PAPER ONL=
INE<br /><br /><br />=C2=A0BUY ECSTASY PILLS, BUY MOLLY ONLINE<br />WHERE C=
AN I BUY ECSTASY PILLS? BUY MOLLY ONLINE<br />BUY ECSTASY PILLS, =C2=A0MOLL=
Y =C2=A0FOR SALE<br />300mg -XTC Ecstasy for sale online<br /><br />https:/=
/t.me/ukverifiedv<br />https://t.me/ukverifiedv<br />https://t.me/ukverifie=
dv<br /><br />=C2=A0BUY MDMA CRYSTALS, MDMA ONLINE<br />WHERE TO BUY MDMA C=
RYSTALS, MDMA ONLINE<br />MDMA CRYSTALS, MDMA FOR SALE ONLINE<br /><br />ht=
tps://t.me/ukverifiedv<br />https://t.me/ukverifiedv<br />https://t.me/ukve=
rifiedv<br /><br />BUY QUALITY POWDER COCAINE (ORDER COKAS) ONLINE<br />Whe=
re to buy high quality cocaine powder?<br />=C2=A0COCAINE POWDER FOR SALE<b=
r />CRYSTAL METH FOR SALE<br /><br />https://t.me/ukverifiedv<br />https://=
t.me/ukverifiedv<br />https://t.me/ukverifiedv<br /><br />BUY KETAMINE ONLI=
NE<br />WHERE CAN YOU BUY KETAMINE ONLINE?<br />HOW TO BUY KETAMINE ONLINE<=
br />BUY KETAMINE FOR EXPERIMENT ONLINE<br /><br />https://t.me/ukverifiedv=
<br />https://t.me/ukverifiedv<br />https://t.me/ukverifiedv<br /><br />Buy=
 Adderall online without a prescription<br />Xanax for sale<br />BUY HERION=
 ONLINE https://t.me/ukverifiedv<br />Buy Adderall pills online<br /><br />=
https://t.me/ukverifiedv<br />https://t.me/ukverifiedv<br />https://t.me/uk=
verifiedv<br /><br />Buy ecstasy online<br />Learn about how to buy dmt onl=
ine<br />Learn about where to buy dmt online<br />DMT for sale online<br />=
Where can i buy ecstasy pills<br />Learn more about how to buy ecstasy <br =
/>Learn about where to buy ecstasy <br /><br />https://t.me/ukverifiedv/235=
5<br />https://t.me/ukverifiedv/2347<br />https://t.me/ukverifiedv/2341?sin=
gle<br />https://t.me/ukverifiedv/2338?single<br />https://t.me/ukverifiedv=
/2325<br />https://t.me/ukverifiedv/2324<br />https://t.me/ukverifiedv/2315=
<br />https://t.me/ukverifiedv/2313<br />https://t.me/ukverifiedv/2312<br /=
>https://t.me/ukverifiedv/2311<br />https://t.me/ukverifiedv/2306<br />http=
s://t.me/ukverifiedv/2304<br />https://t.me/ukverifiedv/2294<br />https://t=
.me/ukverifiedv/2293<br />https://t.me/ukverifiedv/2291<br />https://t.me/u=
kverifiedv/2290<br />https://t.me/ukverifiedv/2284<br />https://t.me/ukveri=
fiedv/2279?single<br />https://t.me/ukverifiedv/2277<br />https://t.me/ukve=
rifiedv/2268<br />https://t.me/ukverifiedv/2241?single<br />https://t.me/uk=
verifiedv/2239<br />https://t.me/ukverifiedv/2238<br />https://t.me/ukverif=
iedv/2237<br />https://t.me/ukverifiedv/2218<br />https://t.me/ukverifiedv/=
2179?single<br />https://t.me/ukverifiedv/2175?single<br />https://t.me/ukv=
erifiedv/2159?single<br />https://t.me/ukverifiedv/2150<br />https://t.me/u=
kverifiedv/2105?single<br />https://t.me/ukverifiedv/2094<br />https://t.me=
/ukverifiedv/2073<br />https://t.me/ukverifiedv/2264<br />https://t.me/ukve=
rifiedv/2245<br />https://t.me/ukverifiedv/2264<br />https://t.me/ukverifie=
dv/2246<br /><br />&gt; =E2=9C=94Fast Shipping <br />&gt; =E2=9C=94Secure P=
ayment Options <br />&gt; =E2=9C=94100% Satisfaction Guaranteed <br />&gt; =
=E2=9C=943 Days Refund Policy <br />&gt; =E2=9C=94100% Money-Back if any is=
sue with the product <br />&gt; =E2=9C=94Shipping Service: Express/Standard=
/Economy <br />&gt; =E2=9C=94Estimated Delivery Time: Express &amp; 3-5 Day=
s <br />&gt; =E2=9C=94Discounts: Get up to 20% off <br /><br /><br /><br />=
<br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_att=
r">On Wednesday, June 27, 2018 at 9:33:04=E2=80=AFAM UTC-7 christophe...@gm=
ail.com wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin:=
 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;=
">hi all,<p>i&#39;m trying to make jailhouse work on my ZCU102 v1.0 (produc=
tion)<br>using petalinux 2017.4 following this documentation : <p><a href=
=3D"https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on=
-zynqmp-zcu102.md" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://github.com/siemens/j=
ailhouse/blob/master/Documentation/setup-on-zynqmp-zcu102.md&amp;source=3Dg=
mail&amp;ust=3D1718480772778000&amp;usg=3DAOvVaw3O-2ZK6g46T00cB9mfX8Jw">htt=
ps://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp=
-zcu102.md</a><p><br>the second uart doesn&#39;t work. After a question on =
the Xilinx forum<p><a href=3D"https://forums.xilinx.com/t5/Embedded-Linux/Z=
CU102-V1-0-petalinux-2017-4-ttyPS1-uart-doesn-t-work/m-p/867113/highlight/f=
alse#M26987" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"htt=
ps://www.google.com/url?hl=3Den&amp;q=3Dhttps://forums.xilinx.com/t5/Embedd=
ed-Linux/ZCU102-V1-0-petalinux-2017-4-ttyPS1-uart-doesn-t-work/m-p/867113/h=
ighlight/false%23M26987&amp;source=3Dgmail&amp;ust=3D1718480772778000&amp;u=
sg=3DAOvVaw0FwX95_ekMUBeHGubyvyL3">https://forums.xilinx.com/t5/Embedded-Li=
nux/ZCU102-V1-0-petalinux-2017-4-ttyPS1-uart-doesn-t-work/m-p/867113/highli=
ght/false#M26987</a><p>i can activate /dev/ttyPS1 on the zcu102 and verify =
it using <p> echo hello &gt; /dev/ttyPS1<p>but i still can&#39;t use it wit=
h jailhouse.<p><br>i have checked with the gic-demo and linux-demo without =
any success.<br>i can use the debug console with gic-demo, but that&#39;s a=
ll.<p>this command should work, but it doesn&#39;t : <p>jailhouse cell linu=
x zynqmp-zcu102-linux-demo.cell Image -d inmate-zynqmp-zcu102.dtb -i rootfs=
.cpio -c &quot;console=3DttyPS1,115200&quot;<p><br>in the zynqmp-zcu102-lin=
ux-demo.c file, the uart address is correct : <p>	.mem_regions =3D {<br>		/=
* UART */ {<br>			.phys_start =3D 0xff010000,<br>			.virt_start =3D 0xff010=
000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUS=
E_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,<br>		},<p=
>what can i do ?<p>regards<br>C.Alexandre</p></p></p></p></p></p></p></p></=
p></p></p></p></p></p></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c8c17894-b200-4b14-b32b-97bb316645c7n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c8c17894-b200-4b14-b32b-97bb316645c7n%40googlegroups.co=
m</a>.<br />

------=_Part_27597_519015632.1718394388763--

------=_Part_27596_1174173678.1718394388763--
