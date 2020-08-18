Return-Path: <jailhouse-dev+bncBDD4NVERQQMBBIWY534QKGQEXSIJB5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA592482DD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 12:23:31 +0200 (CEST)
Received: by mail-qv1-xf40.google.com with SMTP id f1sf12954875qvx.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 03:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h4Z9AWMRim10YUNw6plOTH4JIvWM3PmqHfji75bc/nk=;
        b=Owk+gdTqGFQmgirO0V+KIE/6Pipq6DJOIbODOF0V3hsm/NK60I5aQqKelOm8vkwzsc
         jK8W/DNxX0vQqzzTOUOjYMXJnSO9EfRW6FO0X5JbpBUGj2pJn8EFPReodyi2sMr/kEDX
         Vmu8LNmCskdOWmGNq79l1qdHE0NsDHzY8XoTR1NxPivOH5JI4Zhyf//ndqSOk+RW4coI
         hsSFwvyWfkJrwJXP3iiFH9yCivdLrFO0TvPhM0hs+/J/dpE/FcsHYykqkzhMigokC+Aw
         0NiZtPzihAxJANFsHPXHkYYG19eCPr274Izcm9lEmpHtwDQobLrzo7bp38wxb407Wzme
         IH6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h4Z9AWMRim10YUNw6plOTH4JIvWM3PmqHfji75bc/nk=;
        b=jQhXZ16kMDRsLDQh5o4aDDCin5tjDuhW/vBFZkZD7vj0ih/kKT8cBy9NKOVZG4lg1E
         l9AAW+y3ZwGUlyNDs59S/vKPDB8fb49S3K0VCeYLaVeGnZz7PN/PWZEEQThP0B/cIhy/
         4T3IwwOW9K3jwr0wNQCIAJp6/ou94fPFqtVeHwdgF/mfVHIMhwNe2rxR17E4sdmbchrh
         CHz/t7PV+nWQtB5Tu/JJ+LQpWVOBA9xxwkvEG37vUW6NxD4/1hQJrmbOoeFZS3qeW3An
         X2N/g4Q53e84/saApnsyiwxwpigq5jXQkoAXDfgkJ3UUwDCRHcd20dgf46Dlk+x9CUWD
         ncjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=h4Z9AWMRim10YUNw6plOTH4JIvWM3PmqHfji75bc/nk=;
        b=NJ51DtQQ6RtGDOD+W1748VdpzPc6lslnqd+KadYWHwijeoLeFGZWquuQ55xnRmY4du
         QCQigVITDPgUoHkvHokGCYBjprNVLJCCoxRqWcFk8Rb3vQigHkjmpKlPUbNCVoPNBIS4
         40rE7crOsvvFmBga2us/k3ocKcSpspXC9xL7Hqyl+9eU8hyA4NgYur6zPa/FEBy3eC63
         NSWjGQTkwnPmg8ctQ92Jqd+Y0rC9UQC0HOFWRNCrLf1PSU78nP0Sg/toYhSBgWkvU3vE
         NALfeYSh0MuT24Bh/J8L558BBio/R5YpQEOISNTYeTEhPd8a8RE5b83tusQUWqNKuNYV
         GAKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532TFJ+YM663X2AEBTa7AJN7j26iH6HWYCke+73uUOeAA0ZP+dpK
	np2LYinQ1INbBPqb4YpMJPw=
X-Google-Smtp-Source: ABdhPJxIEIxoRU7oTotGBURE52Ioeezfn9hMxuKZ0dQVDCvrFsFYWs+c1pls4Io984cNwek7yK61fQ==
X-Received: by 2002:ac8:6e9b:: with SMTP id c27mr17513651qtv.189.1597746210417;
        Tue, 18 Aug 2020 03:23:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:120e:: with SMTP id u14ls231993qkj.3.gmail; Tue, 18
 Aug 2020 03:23:29 -0700 (PDT)
X-Received: by 2002:a05:620a:11a6:: with SMTP id c6mr12978918qkk.209.1597746209762;
        Tue, 18 Aug 2020 03:23:29 -0700 (PDT)
Date: Tue, 18 Aug 2020 03:23:29 -0700 (PDT)
From: Julian Stehling <julian.stehling@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <50d7d2aa-eaf9-4a76-8423-c57d352b701do@googlegroups.com>
In-Reply-To: <7c62da68-5d6e-49dc-8c4c-ea8eb8d56e1ao@googlegroups.com>
References: <7c62da68-5d6e-49dc-8c4c-ea8eb8d56e1ao@googlegroups.com>
Subject: Re: Non-root Linux on the Jetson TX2-board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1020_708697109.1597746209218"
X-Original-Sender: Julian.Stehling@gmail.com
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

------=_Part_1020_708697109.1597746209218
Content-Type: multipart/alternative; 
	boundary="----=_Part_1021_340932404.1597746209219"

------=_Part_1021_340932404.1597746209219
Content-Type: text/plain; charset="UTF-8"

Ok nevermind found out myself, that i was confused about hex and decimal 
values

Julian

Am Dienstag, 18. August 2020 12:12:16 UTC+2 schrieb Julian Stehling:
>
> I am currently trying to make a non-root Linux-cell work on the Jetson 
> TX2-board. I have created a new jetson-tx2-linux-demo.c file and have made 
> a inmate-jetson-tx2.dts file according to the other ARM examples given.
>
> When i try to start the cell with
>
>  sudo jailhouse cell linux 
>> ~/linux-jailhouse-jetson/configs/arm64/jetson-tx2-linux-demo.cell 
>> /boot/Image --dtb 
>> ~/linux-jailhouse-jetson/configs/arm64/dts/inmate-jetson-tx2.dtb -i 
>> /boot/initrd
>
>
> i get the following error:
>
> Traceback (most recent call last):
>
>   File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 846, in 
>> <module>
>
>     arch.setup(args, config)
>
>   File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 378, in 
>> setup
>
>     reg += struct.pack(reg_format, region.virt_start, region.size)
>
> struct.error: 'I' format requires 0 <= number <= 4294967295
>
>
> My jetson-tx2-demo-linux.c looks like this:
>
>  
>
> #include <jailhouse/types.h>
>
> #include <jailhouse/cell-config.h>
>
>
>> #define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>
>
>> struct {
>
> struct jailhouse_cell_desc cell;
>
> __u64 cpus[1];
>
> struct jailhouse_memory mem_regions[5];
>
> struct jailhouse_irqchip irqchips[1];
>
> struct jailhouse_pci_device pci_devices[1];
>
> } __attribute__((packed)) config = {
>
> .cell = {
>
> .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>
> .revision = JAILHOUSE_CONFIG_REVISION,
>
> .name = "jetson-tx2-linux-demo",
>
> .flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
>
> JAILHOUSE_CELL_DEBUG_CONSOLE,
>
>
>> .cpu_set_size = sizeof(config.cpus),
>
> .num_memory_regions = ARRAY_SIZE(config.mem_regions),
>
> .num_irqchips = ARRAY_SIZE(config.irqchips),
>
> .num_pci_devices = ARRAY_SIZE(config.pci_devices),
>
> .vpci_irq_base = 300,
>
> },
>
>
>> .cpus = {
>
> 0x18,
>
> },
>
>
>> .mem_regions = {
>
> /* UART */ {
>
> .phys_start = 0x3100000,
>
> .virt_start = 0x3100000,
>
> .size = 0x1000,
>
> .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>
> },
>
> /* RAM */ {
>
> .phys_start = 0x270000000,
>
> .virt_start = 0x0,
>
> .size = 0x10000,
>
> .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>
> JAILHOUSE_MEM_LOADABLE,
>
> },
>
> /* RAM */ {
>
> .phys_start = 0x255310000,
>
> .virt_start = 0x255310000,
>
> .size = 0x1acf0000,
>
> .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>
> JAILHOUSE_MEM_LOADABLE,
>
> },
>
> /* communication region */ {
>
> .virt_start = 0x80000000,
>
> .size = 0x00001000,
>
> .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>
> JAILHOUSE_MEM_COMM_REGION,
>
> },
>
>
>> /* IVHSMEM  1*/ {
>
>                         .phys_start = 0x27f000000,
>
>                         .virt_start = 0x27f000000,
>
>                         .size = 0x1000,
>
>                         .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE 
>
>                         | JAILHOUSE_MEM_ROOTSHARED,
>
>
>>                 },
>
>
>>               
>
> },
>
>
>> .irqchips = { 
>
> /* GIC */
>
> {
>
> .address = 0x03881000,
>
> .pin_base = 288,
>
> .pin_bitmap = {
>
> 0,
>
> 1 << (330 - 320) /* irq 330 */
>
> },
>
> },
>
> },
>
>
>> .pci_devices = {
>
>                 {
>
>                         .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>
>                         .bdf = 0x0,
>
>                         .bar_mask = {
>
>                                 0xffffff00, 0xffffffff, 0x00000000,
>
>                                 0x00000000, 0x00000000, 0x00000000,
>
>                         },
>
> .shmem_region = 3,
>
>                         .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>
>                         .domain = 0x0,
>
>                 },
>
>
>>                 
>
>         },
>
>
>> };
>
>
> So my question is, whrere to search for the error, since the defined 
> memory regions are in bounds of the value given by the error message.
>
> Thanks for any advice
>
> Julian
>
>
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/50d7d2aa-eaf9-4a76-8423-c57d352b701do%40googlegroups.com.

------=_Part_1021_340932404.1597746209219
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok nevermind found out myself, that i was confused about h=
ex and decimal values<div><br></div><div>Julian</div><div><br>Am Dienstag, =
18. August 2020 12:12:16 UTC+2 schrieb Julian Stehling:<blockquote class=3D=
"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc s=
olid;padding-left: 1ex;"><div dir=3D"ltr">I am currently trying to make a n=
on-root Linux-cell work on the Jetson TX2-board. I have created a new jetso=
n-tx2-linux-demo.c file and have made a inmate-jetson-tx2.dts file accordin=
g to the other ARM examples given.<div><br></div><div>When i try to start t=
he cell with</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">=C2=A0sudo jailhouse cell linux ~/linux-jailhouse-jetson/<wbr>confi=
gs/arm64/jetson-tx2-<wbr>linux-demo.cell /boot/Image --dtb ~/linux-jailhous=
e-jetson/<wbr>configs/arm64/dts/inmate-<wbr>jetson-tx2.dtb -i /boot/initrd<=
/blockquote><div><br></div><div>i get the following error:</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Traceback (most recen=
t call last):</blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>=C2=A0 File &quot;/usr/local/libexec/jailhouse/<wbr>jailhouse-cell-linux&q=
uot;, line 846, in &lt;module&gt;</blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">=C2=A0 =C2=A0 arch.setup(args, config)</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 File &quot;/usr/local=
/libexec/jailhouse/<wbr>jailhouse-cell-linux&quot;, line 378, in setup</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 reg=
 +=3D struct.pack(reg_format, region.virt_start, region.size)</blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">struct.error: &#39;I&#39; =
format requires 0 &lt;=3D number &lt;=3D 4294967295</blockquote><div><br></=
div><div>My jetson-tx2-demo-linux.c looks like this:</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">#include &lt;jailhouse/types.h&gt=
;</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">#include &l=
t;jailhouse/cell-config.h&gt;</blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])</blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br></blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">struct {</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">	</span>st=
ruct jailhouse_cell_desc cell;</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><span style=3D"white-space:pre">	</span>__u64 cpus[1];</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"=
white-space:pre">	</span>struct jailhouse_memory mem_regions[5];</blockquot=
e><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"white-sp=
ace:pre">	</span>struct jailhouse_irqchip irqchips[1];</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">	=
</span>struct jailhouse_pci_device pci_devices[1];</blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">} __attribute__((packed)) config =3D =
{</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=
=3D"white-space:pre">	</span>.cell =3D {</blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><span style=3D"white-space:pre">		</span>.signa=
ture =3D JAILHOUSE_CELL_DESC_SIGNATURE,</blockquote><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><span style=3D"white-space:pre">		</span>.revisi=
on =3D JAILHOUSE_CONFIG_REVISION,</blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><span style=3D"white-space:pre">		</span>.name =3D &qu=
ot;jetson-tx2-linux-demo&quot;,</blockquote><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><span style=3D"white-space:pre">		</span>.flags =3D JAIL=
HOUSE_CELL_PASSIVE_COMMREG |</blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><span style=3D"white-space:pre">			</span> JAILHOUSE_CELL_D=
EBUG_CONSOLE,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span s=
tyle=3D"white-space:pre">		</span>.cpu_set_size =3D sizeof(config.cpus),</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"=
white-space:pre">		</span>.num_memory_regions =3D ARRAY_SIZE(config.mem_reg=
ions)<wbr>,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
span style=3D"white-space:pre">		</span>.num_irqchips =3D ARRAY_SIZE(config=
.irqchips),</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
span style=3D"white-space:pre">		</span>.num_pci_devices =3D ARRAY_SIZE(con=
fig.pci_devices)<wbr>,</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span style=3D"white-space:pre">		</span>.vpci_irq_base =3D 300,=
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=
=3D"white-space:pre">		</span></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><span style=3D"white-space:pre">	</span>},</blockquote><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br></blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">	</=
span>.cpus =3D {</blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><span style=3D"white-space:pre">		</span>0x18,</blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">	</sp=
an>},</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br></b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"=
white-space:pre">	</span>.mem_regions =3D {</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">		</span>/=
* UART */ {</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
span style=3D"white-space:pre">			</span>.phys_start =3D 0x3100000,</blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"white=
-space:pre">			</span>.virt_start =3D 0x3100000,</blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">			</sp=
an>.size =3D 0x1000,</blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><span style=3D"white-space:pre">			</span>.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE |</blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><span style=3D"white-space:pre">				</span>JAILHOUSE_MEM_IO=
 | JAILHOUSE_MEM_ROOTSHARED,</blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><span style=3D"white-space:pre">		</span>},</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:p=
re">		</span>/* RAM */ {</blockquote><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span style=3D"white-space:pre">			</span>.phys_start =3D 0x270=
000000,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span=
 style=3D"white-space:pre">			</span>.virt_start =3D 0x0,</blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre=
">			</span>.size =3D 0x10000,</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><span style=3D"white-space:pre">			</span>.flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><span style=3D"white-space:pre">				</span>JAILHO=
USE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |</blockquote><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><span style=3D"white-space:pre">				</span>JAILHOU=
SE_MEM_LOADABLE,</blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><span style=3D"white-space:pre">		</span>},</blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">		</span=
>/* RAM */ {</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<span style=3D"white-space:pre">			</span>.phys_start =3D 0x255310000,</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"wh=
ite-space:pre">			</span>.virt_start =3D 0x255310000,</blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">		=
	</span>.size =3D 0x1acf0000,</blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span style=3D"white-space:pre">			</span>.flags =3D JAILH=
OUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</blockquote><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><span style=3D"white-space:pre">				</span>JAILHOU=
SE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |</blockquote><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><span style=3D"white-space:pre">				</span>JAILHOUS=
E_MEM_LOADABLE,</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><span style=3D"white-space:pre">		</span>},</blockquote><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">		</span>=
/* communication region */ {</blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><span style=3D"white-space:pre">			</span>.virt_start =3D 0=
x80000000,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><s=
pan style=3D"white-space:pre">			</span>.size =3D 0x00001000,</blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"white-space=
:pre">			</span>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"whi=
te-space:pre">				</span>JAILHOUSE_MEM_COMM_REGION,</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">		</=
span>},</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br><=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=
=3D"white-space:pre">		</span>/* IVHSMEM=C2=A0 1*/ {</blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x27f00000=
0,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .=
virt_start =3D 0x27f000000,</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x1000,</blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAIL=
HOUSE_MEM_WRITE=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | JAILHOUSE_MEM_ROOTSHARED,</blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br></blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 },</blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">	</span>=
},</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br></bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"whi=
te-space:pre">	</span>.irqchips =3D {=C2=A0</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">		</span>/=
* GIC */</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><spa=
n style=3D"white-space:pre">		</span>{</blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><span style=3D"white-space:pre">			</span>.addres=
s =3D 0x03881000,</blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><span style=3D"white-space:pre">			</span>.pin_base =3D 288,</blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"white-s=
pace:pre">			</span>.pin_bitmap =3D {</blockquote><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><span style=3D"white-space:pre">				</span>0,</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"wh=
ite-space:pre">				</span>1 &lt;&lt; (330 - 320) /* irq 330 */</blockquote>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"white-spac=
e:pre">			</span>},</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><span style=3D"white-space:pre">		</span>},</blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">	</sp=
an>},</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br></b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"=
white-space:pre">	</span>.pci_devices =3D {</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 {</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bdf =3D 0x0,</blockquote>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bar_mask =3D {=
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xffffff00, 0xffffffff, 0x00000000,</blockquote=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x00000000, 0x00000000, 0x00000000,</blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },</blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><span style=3D"white-space:pre">						<=
/span>.shmem_region =3D 3,</blockquote><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_<wbr>UND=
EFINED,</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 .domain =3D 0x0,</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },</bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br></blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</blockquote><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 },</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><br></blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">};</blockquote><div><br></div><div>So my=
 question is, whrere to search for the error, since the defined memory regi=
ons are in bounds of the value given by the error message.</div><div><br></=
div><div>Thanks for any advice</div><div><br></div><div>Julian</div><div><b=
r></div><div><br></div><div><br></div></div></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/50d7d2aa-eaf9-4a76-8423-c57d352b701do%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/50d7d2aa-eaf9-4a76-8423-c57d352b701do%40googlegroups.co=
m</a>.<br />

------=_Part_1021_340932404.1597746209219--

------=_Part_1020_708697109.1597746209218--
